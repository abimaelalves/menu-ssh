asroot=$(echo "$*"|grep "\-\-root")

if [ ! "$asroot" = "" ]
then
   USER=root
fi

if [ "$1" != "" ]
then
   if [ "$2" != "" ]
   then
      if [ "$2" = "ip" ]
      then
         par2=$2
         grep -i "$1" $0|grep -v echo| awk '{ print $9 }'|sed -e "s/\${USER}/${USER}/g"|sed -e "s/;//g"
         exit 0
      else
         echo "Use: $0 [TEXT TO FIND] [ip]"
         exit 1
      fi
   else
      grep -i "$1" $0|grep -v echo
      exit 0
   fi
fi

option=""
suboption=""
while [ "$option" != "0" ]
do
    clear
    echo
    echo "████████████████████████████████████████ Painel SSH ████████████████████████████████████████"
    echo
    echo "   0 - Sair"
    echo "   1 - Datacenter 1"
    echo "   2 - Datacenter 2"
    echo
    echo "████████████████████████████████████████████████████████████████████████████████████████████"
    echo
    echo -n "Informe a opção: "
    read option
 
    if [ "$option" == "1" ] # Datacenter 1
    then
        suboption=""
        while [ "$suboption" != "0" ]
        do
            clear
            echo
            echo "███████████████ Datacenter 1 ███████████████"
            echo
            echo "   0 - Voltar"
            echo "   1 - VPS 1"
            echo "   2 - VPS 2"
            echo
            echo "████████████████████████████████████████████"
            echo
            echo -n "Informe a opção: "
            read suboption
            if [ "$suboption" == "1" ]; then ssh ${USER}@192.168.0.6; fi; # Datacenter 1 / VPS 1
            if [ "$suboption" == "2" ]; then ssh ${USER}@192.168.0.5; fi; # Datacenter 1 / VPS 2
        done
    fi

    if [ "$option" == "2" ] # Datacenter 2
    then
        suboption=""
        while [ "$suboption" != "0" ]
        do
            clear
            echo
            echo "█████████████████ Datacenter 2 ████████████████"
            echo
            echo "   0 - Voltar"
            echo "   1 - Cliente 1"
            echo "   2 - Cliente 2"
            echo
            echo "███████████████████████████████████████████████"
            echo
            echo -n "Informe a opção: "
            read suboption

            if [ "$suboption" == "1" ]; # Cliente 1 
            then 
               subsub=""
               while [ "$subsub" != "0" ]
               do
                  clear
                  echo
                  echo "██████████████████ Cliente 1 █████████████████"
                  echo
                  echo "   0 - Voltar"
                  echo "   1 - VPS 1"     
                  echo "   2 - VPS 2"
                  echo
                  echo "██████████████████████████████████████████████"
                  echo
                  echo -n "Informe a opção: "
                  read subsub
                  if [ "$subsub" == "1" ]; then ssh ${USER}@200.200.0.1; fi; # Datacenter 2 / Cliente 1 / VPS 1
                  if [ "$subsub" == "2" ]; then ssh ${USER}@200.200.0.2; fi; # Datacenter 2 / Cliente 1 / VPS 2
               done
            fi

            if [ "$suboption" == "2" ]; # Cliente 2
            then 
               subsub=""
               while [ "$subsub" != "0" ]
               do
                  clear
                  echo
                  echo "██████████████████ Cliente 2 █████████████████"
                  echo
                  echo "   0 - Voltar"
                  echo "   1 - VPS 1"     
                  echo "   2 - VPS 2"
                  echo
                  echo "██████████████████████████████████████████████"
                  echo
                  echo -n "Informe a opção: "
                  read subsub
                  if [ "$subsub" == "1" ]; then ssh ${USER}@200.200.0.3; fi; # Datacenter 2 / Cliente 2 / VPS 1
                  if [ "$subsub" == "2" ]; then ssh ${USER}@200.200.0.4; fi; # Datacenter 2 / Cliente 2 / VPS 2
               done
            fi
        done
    fi
done