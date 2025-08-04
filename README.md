# MailAccount‑OAuth2

Extensão para OTOBO/OTRS que habilita o recebimento de e‑mails via OAuth 2.0 ([RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749)).  
Suporta POP3 e IMAP usando *access tokens* renováveis, eliminando o uso direto de senhas.

## Recursos

- Fluxo completo de autorização e renovação de tokens  
  (`Kernel/System/OAuth2.pm`, `Kernel/System/OAuth2/MailAccount.pm`)

- Conectores POP3 e IMAP com login via SASL XOAUTH2  
  (`Kernel/System/MailAccount/POP3OAuth2.pm`, `Kernel/System/MailAccount/IMAPOAuth2.pm`)

- Tela de administração ajustada para perfis OAuth2  
  (`Custom/Kernel/Modules/AdminMailAccount.pm`, `var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js`)

- Armazenamento de *refresh tokens* na tabela `auth_token`

- Modelos de provedores pré‑configurados para Microsoft Azure e Google Workspace, além de perfis customizáveis

---

## Instalação

### Download

```bash
git clone https://github.com/.../MailAccount-OAuth2.git
```

### Instalação do pacote

- Instale o pacote `.sopm` via **Package Manager**  
  **ou**  
  coloque os arquivos em `Custom/`

- Execute o script de migração de banco incluído no `.sopm`  
  (O instalador já cria a tabela `auth_token` e adiciona `oauth2_profile` em `mail_account`)

---

## Configuração

Acesse: **SysConfig → Core::Email::OAuth2**

1. Ajuste os blocos `OAuth2::MailAccount::Providers`  
   (endpoints, *scopes*, hosts)

2. Cadastre perfis em `OAuth2::MailAccount::Profiles`  
   (Nome, `ClientID`, `ClientSecret`, `ProviderName`)

3. Habilite parâmetros gerais em `OAuth2::Settings`  
   (`TTL`, comprimento do `state`, etc.)

---

## Uso

1. Acesse **Admin → Mail Account**

2. Escolha o tipo `IMAPOAuth2` ou `POP3OAuth2`

3. Selecione o *Profile* configurado e salve

4. O sistema redireciona para o provedor, solicita consentimento  
   e armazena `refresh_token` e `access_token`

5. Conexões futuras renovam automaticamente o `access_token`.  
   Se o provedor não retornar novo `refresh_token`, o existente será reutilizado.

---

## Estrutura do Projeto

```
Custom/Kernel/...            # Overrides para tela e lógica de contas
Kernel/System/OAuth2.pm      # Núcleo de autorização/renovação
Kernel/System/OAuth2/...     # Especializações para MailAccount
Kernel/System/MailAccount/   # Conectores IMAPOAuth2 e POP3OAuth2
Kernel/Config/Files/XML/...  # Configurações SysConfig
doc/                         # Documentação e traduções
var/httpd/htdocs/js/...      # JS para interface de administração
```

---

## Pré‑requisitos

- **OTOBO** ≥ 11.0.x  
- **Perl**: `Mail::IMAPClient`, `MIME::Base64` e demais dependências padrão do OTOBO  
- Aplicativos OAuth2 devidamente cadastrados nos provedores (com `Client ID` e `Secret`)

---

## Licença

GPL v3 – consulte o cabeçalho dos arquivos ou acesse:  
[https://www.gnu.org/licenses/](https://www.gnu.org/licenses/)
