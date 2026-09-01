# KOSHIBAR VLESS — Google Cloud Run

VLESS + WebSocket destiné à être exécuté sur Google Cloud Run.

## Configuration

Nom du service :

koshibar-vless

Protocole :

VLESS

Transport :

WebSocket

WebSocket Path :

/koshibar/vless

Port du conteneur :

8080

UUID :

7b3f2c91-6a84-4e17-bd52-9c1a6f8e3d40

TLS :

Géré par Google Cloud Run

Port HTTPS :

443

## Structure

/Koshibar/100%/vless/

├── Dockerfile
├── config.json
└── README.md

## Construction

docker build -t koshibar-vless .

## Test local

docker run --rm \
  -p 8080:8080 \
  koshibar-vless

## Déploiement Cloud Run

Depuis Google Cloud Shell :

gcloud run deploy koshibar-vless \
  --source . \
  --region REGION \
  --port 8080 \
  --allow-unauthenticated \
  --timeout 3600

Remplacer REGION par la région de ton service.

## Configuration Cloud Run

Port du conteneur :

8080

Protocole :

HTTP/1

Accès :

Autoriser les invocations non authentifiées

Délai d'expiration :

3600 secondes

HTTP/2 de bout en bout :

DÉSACTIVÉ

## Connexion

Une fois le service déployé, Google Cloud Run fournit une URL HTTPS.

Exemple :

https://koshibar-vless-xxxxx-REGION.run.app

Utiliser cette adresse comme serveur dans le client VLESS.

Port :

443

UUID :

7b3f2c91-6a84-4e17-bd52-9c1a6f8e3d40

Network :

WebSocket

Path :

/koshibar/vless

TLS :

ON

SNI :

nom-de-domaine-ou-adresse-cloud-run

## Architecture

Client VLESS
       |
       | HTTPS / TLS :443
       v
Google Cloud Run
       |
       | HTTP/WebSocket
       v
Xray :8080
       |
       v
Internet

## Important

Le certificat TLS n'est pas placé dans config.json.

Google Cloud Run gère le HTTPS/TLS devant le conteneur.

Xray écoute uniquement en WebSocket sur le port 8080.

Les WebSockets sont pris en charge par Cloud Run, mais les connexions sont soumises au délai d'expiration configuré. Le maximum actuel est de 60 minutes.

Les clients doivent donc pouvoir se reconnecter après une coupure.

## Logs

Pour consulter les logs :

gcloud run services logs read koshibar-vless \
  --region REGION

## Mise à jour

Après une modification :

gcloud run deploy koshibar-vless \
  --source . \
  --region REGION \
  --port 8080 \
  --allow-unauthenticated \
  --timeout 3600
