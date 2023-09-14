<h1>Projeto de Laboratório com Vagrant</h1>
<h3>Instruções para implementação</h3>

<ol>
    <li>Sofwares Necessários: </li>
    <ul>
        <li>Vagrant</li>
        <li>VirtualBox</li>
    </ul>
    <li>Como rodar: </li>
    <ul>
        <li>Após clonar o repositório e instalar os softwares necessários, na pasta de download execute o Vagrantfile no pelo terminal com o comando: </li>
    </ul>
    </br>

```
# vagrant up
```
</ol>

<h3>Composição do Laboratório:</h3>



<ul>
    <li>VM 1 - Gateway</li>
    <li>VM 2 - Servidor WEB com Apache</li>
    <li>VM 3 - Banco de Dados</li>
</ul>
<br>
<h3>Proposta: </h3>
<p>A proposta do trabalho é criar um ambiente virtualizado composto de 3 máquinas, onde a VM 1 será um gateway que será utilziado pelas VMs 2 e 3, utilizando as ferramentas <b>Vagrant</b> e <b>VirtualBox</b> (As versões utilizadas foram as 2.2.19 e 6.1 respectivamente).</p>

<br>
<h3>Configurações das VMs</h3>

***

<ol>
    <li>VM 1 - Gateway</li>
    <ul>
        <li>Sistema Operacional: Ubuntu Server 20.04 LTS</li>
        <li>Interface de Rede 1: IP Privado Estático (192.168.56.254)</li>
        <li>Interface de Rede 2 (wlp0s20f3): IP Publico DHCP</li>
        <li>Função: Gateway de Rede</li>
        <li>Deve fornecer acesso à Internet para as VMs1 e VM2.</li>
    </ul>
    <li>VM 2 - Servidor WEB</li>
    <ul>
        <li>Sistema Operacional: Ubuntu Server 20.04 LTS</li>
        <li>Interface de Rede 1 (wlp0s20f3): IP Privado Estático (192.168.56.15)</li>
        <li>Função: Servidor Web</li>
        <li>Pasta Compartilhada: `/var/www/html`</li>
        <li>Deve fornecer uma página html acessivel pela máquina host.</li>
    </ul>
    <li>VM 3 - Banco de Dados</li>
    <ul>
        <li>Sistema Operacional: Ubuntu Server 20.04 LTS</li>
        <li>Interface de Rede 1 (wlp0s20f3): IP Privado Estático (192.168.56.16)</li>
        <li>Função: Banco de Dados</li>
        <li>Deve fornecer um banco de dados acessivel por todos na rede</li>
    </ul>
</ol>

<br>
<h3>Scripts de Configuração</h3>

***

<ol>
    <li>ShellScript VM1 - Gateway</li>
    <ul>
        <li> Instala o pacote net-tools e realiza as configurações de rede, onde o arquivo ativa encaminhamento de portas para o tráfego de rede 
    </ul>
    <li>ShellScript VM2 - Servidor WEB</li>
    <ul>
        <li> Realiza a instalação do Apache e o net-tools, apaga o gateway padrão da rede e define o novo gateway com o IP Máquina 1 (192.168.56.254). Depois realiza a mudança de DNS para o DNS 8.8.8.8
    </ul>
    <li>ShellScript VM3 - Banco de Dados</li>
    <ul>
        <li>Realiza a instalação do MySql e o net-tools, apaga o gateway padrão da rede e define o novo gateway com o IP Máquina 1 (192.168.56.254). Depois realiza a mudança de DNS para o DNS 8.8.8.8
    </ul>
</ol>