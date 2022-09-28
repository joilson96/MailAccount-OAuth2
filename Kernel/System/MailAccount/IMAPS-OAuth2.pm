# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2022 Rother OSS GmbH, https://otobo.de/
# --
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# --

package Kernel::System::MailAccount::IMAPS;

use strict;
use warnings;

# There are currently errors on Perl 5.20 on Travis, disable this check for now.
## nofilter(TidyAll::Plugin::OTOBO::Perl::SyntaxCheck)
use IO::Socket::SSL;
use MIME::Base64;

use parent qw(Kernel::System::MailAccount::IMAP);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::OAuth2::MailAccount',
);

sub Connect {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for (qw(ID Login Password Host Timeout Debug)) {
        if ( !defined $Param{$_} ) {
            return (
                Successful => 0,
                Message    => "Need $_!",
            );
        }
    }

    my $AccessToken = $Kernel::OM->Get('Kernel::System::OAuth2::MailAccount')->GetAccessToken(
        MailAccountID => $Param{ID}
    );

    if ( !$AccessToken ) {
        return (
            Successful => 0,
            Message    => "IMAPSOAuth2: Could not request access token for $Param{Login}/$Param{Host}'. The refresh token could be expired or invalid."
        );
    }

    my $Type = 'IMAPSOAUTH2';

    # connect to host
    my $IMAPObject = Net::IMAP::Simple->new(
        $Param{Host},
        timeout     => $Param{Timeout},
        debug       => $Param{Debug},
        use_ssl     => 1,
        ssl_options => [
            SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE(),
        ],
    );
    if ( !$IMAPObject ) {
        return (
            Successful => 0,
            Message    => "$Type: Can't connect to $Param{Host}"
        );
    }

    # Auth via SASL XOAUTH2.
    my $SASLXOAUTH2 = encode_base64( 'user=' . $Param{Login} . "\x01auth=Bearer " . $AccessToken . "\x01\x01" );
    $IMAPObject->authenticate( 'XOAUTH2', sub { return $SASLXOAUTH2 } );

    if ( !$IMAPObject || !$IMAPObject->IsAuthenticated() ) {
        return (
            Successful => 0,
            Message    => "IMAPSOAuth2: Can't connect to $Param{Host}: $@\n"
        );
    }

    return (
        Successful => 1,
        IMAPObject => $IMAPObject,
        Type       => $Type,
    );
}

1;
