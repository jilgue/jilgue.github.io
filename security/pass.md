# PASS


https://www.passwordstore.org/

```bash
$ gpg --full-generate-key
gpg: clave 7E5F3ABE35F95E35 marcada como de confianza absoluta
gpg: creado el directorio '/home/cmartin/.gnupg/openpgp-revocs.d'
gpg: certificado de revocación guardado como '/home/cmartin/.gnupg/openpgp-revocs.d/7F1F42DCDBD8ACF0695CB1257E5F3ABE35F95E35.rev'
claves pública y secreta creadas y firmadas.

pub   rsa3072 2020-11-17 [SC]
      7F1F42DCDBD8ACF0695CB1257E5F3ABE35F95E35
uid                      César Martín Cristóbal <cesar@callepuzzle.com>
sub   rsa3072 2020-11-17 [E]
```

```bash
$ pass init 7E5F3ABE35F95E35
mkdir: se ha creado el directorio '/home/cmartin/.password-store/'
Password store initialized for 7E5F3ABE35F95E35
```
