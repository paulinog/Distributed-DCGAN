
# Atividade 6

## Criar Instância VM

O primeiro passo para esta atividade é acessar o serviço AWS Elastic Computing (EC2) pela conta de estudante da Unicamp. 

Foi criada uma máquina virtual (VM) do tipo "t2.medium", para rodar o sistema operacional Ubuntu Server 20.04 LTS. Foi utilizado 30GiB de armazenamento SSD. 


---

## Subindo ambiente

Para instalar o docker na VM, siga as instruções da seguinte página:

https://docs.docker.com/engine/install/ubuntu/

Após a instalação, faça o clone deste repositótio:

```sh
git clone https://github.com/paulinog/Distributed-DCGAN.git -b ativ-6-exp-1
```

Entre no diretório clonado e construa a imagem do container Docker:

```sh
cd Distributed-DCGAN
docker build -t dist_dcgan:mo833 .
```

---

Para baixar e descompactar o conjunto de dados usados no experimento:

```sh
mkdir cifar10 && cd cifar10
wget --no-check-certificate https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
tar -xvf cifar-10-python.tar.gz
cd ..
``` 

---

## Rodando a aplicação

Para rodar o experimento, execute o script:

```sh
./experiments/ativ-6-exp-1/run.sh
```
---

*Nota: ao final desse experimento, a instância da VM foi terminada.* 

---

          Guilherme Paulino
        University of Campinas


