
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'


NB_secret=$((RANDOM % 10 + 1))

TRIES=0


clear
echo -e "${GREEN}Devine le Nombre ${NC}"
echo "Je pense à un nombre entre 1 et 10."
echo "Peux-tu le deviner ?"

while true; do
    read -p "Entrez un nombre : " DEVINER

    if ! [[ "$DEVINER" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Veuillez entrer un nombre valide !${NC}"
        continue
    fi

    ((TRIES++))

    if (( DEVINER < NB_secret )); then
        echo -e "${YELLOW}C'est plus ! Essaie encore.${NC}"
    elif (( DEVINER > NB_secret )); then
        echo -e "${YELLOW}C'est moins ! Essaie encore.${NC}"
    else
        echo ""
        echo -e "${GREEN} Bravo ! Tu as trouvé le nombre en $TRIES tentative(s).${NC}"
        exit 0
    fi
done
