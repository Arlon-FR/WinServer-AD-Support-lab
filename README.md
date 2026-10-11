# WinServer-AD-Support-lab
1. 

- Configuração de VMs (Windows Server 2025 e Client 11) no VirtualBox com isolamento de Rede Interna e aplicação de Sysprep para geração de clones linked com MACs distintos.

- Configuração do servidor com IP estático (192.168.10.10/24) e DNS local (127.0.0.1).

- Instalação das funções de AD DS, DNS e DHCP via Server Manager.

- Promoção do servidor a Domain Controller da floresta lab.local e ingresso do Windows 11 no domínio apontando para o IP do servidor.

2.

- Criação de uma Organizational Unit (OU) exclusiva para a equipa de suporte técnico no Active Directory.

- Criação da conta padrão arlon.rocha e aplicação rigorosa de Delegation of Control, restringindo a gestão, criação e exclusão de utilizadores apenas ao perímetro daquela OU.

3.

- O Incidente: Tentativa de instalação remota das ferramentas RSAT (dsa.msc) no cliente resultou em bloqueio silencioso, pois as políticas do domínio redirecionavam o tráfego para o WSUS interno inexistente.

- A Resolução: Ativação temporária de um adaptador NAT para saída externa. Execução de script em PowerShell injetando localmente as chaves de registo RepairContentServerSource e UseWindowsUpdate com o valor 2 para bypass do WSUS.

- Reinício do serviço wuauserv e injeção do pacote via comando: Add-WindowsCapability -Online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0.

4. 

- Desativação do NAT para restabelecimento do isolamento do laboratório e execução de ipconfig /flushdns para limpar rotas externas.

- Teste Positivo: Confirmação de permissões totais sobre os objetos da OU delegada ao utilizador de suporte.

- Teste Negativo (Segurança): Validação ativa das restrições ao forçar a criação de objetos na raiz do domínio e na OU de Domain Controllers, resultando no bloqueio correto por "Acesso Negado".
