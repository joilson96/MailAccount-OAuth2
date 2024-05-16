.. image:: ../images/otobo-logo.png
   :align: center
|

.. toctree::
    :maxdepth: 2
    :caption: Contents

Sacrifice to Sphinx
===================

Description
===========
Enables receiving emails (IMAP and POP3) via OAuth 2.0 authorization (RFC 6749).

System requirements
===================

Framework
---------
OTOBO 11.0.x

Packages
--------
\-

Third-party software
--------------------
\-

Usage
=====

Setup
-----

Configuration Reference
-----------------------

Core::Email::OAuth2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

OAuth2::MailAccount::Profiles###Custom3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Configure custom OAuth 2 application profiles. "Name" should be unique and will be displayed on the Mail Account Management screen. "ProviderName" can be "MicrosoftAzure", "GoogleWorkspace" or a custom provider like "Custom1" (see OAuth2::MailAccount::Providers).

OAuth2::MailAccount::Providers###MicrosoftAzure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Authorization server settings for Microsoft Azure/Microsoft 365.

OAuth2::MailAccount::Providers###Custom3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Custom authorization server settings.

OAuth2::MailAccount::Providers###Custom2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Custom authorization server settings.

OAuth2::MailAccount::Profiles###Custom1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Configure custom OAuth 2 application profiles. "Name" should be unique and will be displayed on the Mail Account Management screen. "ProviderName" can be "MicrosoftAzure", "GoogleWorkspace" or a custom provider like "Custom1" (see OAuth2::MailAccount::Providers).

OAuth2::MailAccount::Providers###Custom1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Custom authorization server settings.

OAuth2::MailAccount::Providers###GoogleWorkspace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Authorization server settings for Google Workspace.

OAuth2::MailAccount::Profiles###Custom2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Configure custom OAuth 2 application profiles. "Name" should be unique and will be displayed on the Mail Account Management screen. "ProviderName" can be "MicrosoftAzure", "GoogleWorkspace" or a custom provider like "Custom1" (see OAuth2::MailAccount::Providers).

Core::OAuth2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

OAuth2::Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
General OAuth2 settings. TTL in seconds.

About
=======

Contact
-------
| Rother OSS GmbH
| Email: hello@otobo.de
| Web: https://otobo.de

Version
-------
Author: |doc-vendor| / Version: |doc-version| / Date of release: |doc-datestamp|
