# KOSHIBAR VLESS

Configuration VLESS + WebSocket avec TLS séparé sur le port 443.

## Structure

/Koshibar/100%/vless/

├── Dockerfile
├── config.json
└── README.md

## Configuration

Protocole :
VLESS

Transport :
WebSocket

Path :
/koshibar/vless

Port Xray :
8080

Port TLS public :
443

UUID :
7b3f2c91-6a84-4e17-bd52-9c1a6f8e3d40

## Construction de l'image

cd "/Koshibar/100%/vless"

docker build -t koshibar-vless .

## Démarrage

docker run -d \
  --name koshibar-vless \
  --restart unless-stopped \
  -p 127.0.0.1:8080:8080 \
  koshibar-vless

## Vérifier le conteneur

docker ps

docker logs koshibar-vless

## TLS sur 443

Le conteneur Xray écoute uniquement sur 8080.

Le TLS est terminé séparément sur le serveur, par exemple avec Nginx :

Client
  ↓
HTTPS :443
  ↓
Nginx
  ↓
WebSocket /koshibar/vless
  ↓
127.0.0.1:8080
  ↓
Xray VLESS
  ↓
Internet

Le certificat TLS et la clé privée ne sont donc pas présents dans config.json.

## Paramètres client

Adresse :
votre-domaine.com

Port :
443

UUID :
7b3f2c91-6a84-4e17-bd52-9c1a6f8e3d40

Network :
WebSocket (WS)

Path :
/koshibar/vless

TLS :
ON

SNI :
votre-domaine.com

Security :
TLS
