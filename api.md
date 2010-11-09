# -*- coding: utf-8 -*-
# API Interne UC-Engine

# Informations transversales à l'API

L'URL de base de L'API est la suivante : http://encre-test.af83.com:5280/api/0.1/

Toutes les autres URL d'appel à cette API sont relative à cette première.

Pour pratiquement chaque appel à une méthode de l'API, certains paramètres sont
récurrents :

    - uid:         Identifiant ucengine de l'utilisateur      uid_63444326443_50150
    - sid:         Identifiant de session ucengine.           330249245470504

Certaines conventions sont à prendre en compte :

- Les méthodes `PUT` et `DELETE` peuvent être simulées dans le cas de clients
  ne supportants pas ces méthodes avec le paramètre `_method`. Par exemple,
  pour simuler un `PUT`, nous effectuerons un `POST` avec le paramètre
  `_method=PUT`.

# Temps
# Récupérer l'heure du serveur

### URL

    GET /time

### Valeur de retour

200 {"result": 1284046082844}

### Remarque

Le timestamp est exprimé en millisecondes depuis Epoch (1 janvier 1970).

# Utilisateur
## Lister les utilisateurs

### URL

    GET /user/

### Parametres

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

200 {"result": [{	"uid":"romain.gauthier@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284046072075"
			}
		},
		{	"uid":"victor.goya@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"phorque"
			}
		}]}

Erreur :

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Enregistrer un nouvel utilisateur

### URL

    PUT /user/{uid}

### Parametres

Dans l'URL :

    - uid:		Identifiant de l'utilisateur.    ex: romain.gauthier@af83.com

Encodés :

    - auth :      Méthode d'authentification utilisée (anonymous, password, token) ;
    - credential :   Élement secret utilisé pour l'authentification (mot de passe, token).
    - metadata :	Tableau contenant les métadonnés (ex. metadata[key]=value).

### Valeurs de retour

Succès :

    201 { "result": "created" }

Erreur :

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Modifier les informations d'un utilisateur

### URL

    POST /user/{uid}

### Parametres

Dans l'URL :

    - uid:		Identifiant de l'utilisateur.    ex: romain.gauthier@af83.com

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504
    - auth :      Méthode d'authentification utilisée (anonymous, password, token) ;
    - credential :   Élement secret utilisé pour l'authentification (mot de passe, token).
    - metadata :	Tableau contenant les métadonnés (ex. metadata[key]=value).

### Valeurs de retour

Succès :

    200 { "result": "ok" }

Erreur :

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Récupérer les informations d'un utilisateur

### URL

    GET /user/{uid}

### Parametres

Dans l'URL :

    - uid:		Identifiant de l'utilisateur.    ex: romain.gauthier@af83.com

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

        200 {"result": {uid":"romain.gauthier@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284046072075"
			}
		}}
Erreur :

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

## Supprimer un utilisateur

### URL

    DELETE /user/{uid}

### Parametres

Dans l'URL :

    - uid:		Identifiant de l'utilisateur.    ex: romain.gauthier@af83.com

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

    200 { "result": "ok" }

Erreur :

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }

# Authentification

### URL

    PUT /presence/{org}/{uid}

### Parametres

Dans l'URL :

	- org :	    Organisation auquel sera rattaché la sesssion ;
	- uid :    Identifiant unique de l'utilisateur.

Encodés :

    - auth :      Méthode d'authentification utilisée (anonymous, password, token) ;
    - _credential :   Élement secret utilisé pour l'authentification (mot de passe, token) ;
    - metadata :	Tableau contenant les métadonnés (ex. metadata[key]=value).

### Valeurs de retour

Succès :

    - 200 { "result": "409832095702309473209" }} : identifiant de
      presence (sid).

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 403 { "error": "bad_credentials" } : l'authentification a échoué ;

# Déconnexion

### URL

    DELETE /presence/{org}/{uid}/{sid}

### Paramètres

Dans l'URL :

	- org :	    Organisation auquel sera rattaché la sesssion ;
	- uid :    Identifiant unique de l'utilisateur.
	- sid :    Identifiant de presence de l'utilisateur.

Encodés :

    - uid:	    Identifiant unique de l'utilisateur courant ;
    - sid:	    Identifiant de presence.

### Valeurs de retour

Succès :

    - 200 { "result": "ok" }}.

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à déconnecté cette presence ;

    - 404 { "error": "not_found" } : la presence n'existe pas.

### Remarques

L'identifiant de l'utilisateur passé dans l'URL n'est pas forcément
identique à l'uid passé dans les paramètres. Il est donc possible,
pour un utilisateur authorisé, de déconnecter un autre utilisateur.

# Meeting
## Rejoindre un meeting

### URL

    PUT /meeting/{org}/all/{meeting}/roster/{uid}

### Parametres

Dans l'URL :

    - org:          Nom de l'organisation ;
    - meeting:      Nom du meeting ;
    - uid:	    Identifiant de l'utilisateur.

Encodés :

    - uid:         Identifiant de l'utilisateur      uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

    - 200 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à rejoindre le meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.

## Quitter un meeting

### URL

    DELETE /meeting/{org}/all/{meeting}/roster/{uid}

### Parametres

Dans l'URL :

    - org:          Nom de l'organisation ;
    - meeting:      Nom du meeting ;
    - uid:	    Identifiant de l'utilisateur.

Encodés :

    - uid:         Identifiant de l'utilisateur      uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

    200 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à quitter le meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.


## Créer un meeting

### URL

    PUT /meeting/{org}/all/{meeting}

### Parametres

Dans l'URL :

    - org:              Organisation.                               af83
    - meeting:          Meeting.                                    demo

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

Encodés (optionels) :

    - _start   Date et heure d'ouverture du meeting.       63444430100
    - _end     Date et heure de fermeture du meeting.      63444430800
    - metadata :	Tableau contenant les métadonnés (ex. metadata[key]=value).

### Remarques

    - Les dates sont exprimés en millisecondes depuis epoch (1 janvier 1970).
    - Si '_end' est absent, le meeting n'a pas de date de fermeture.
    - Si '_start' et 'end' sont absents, l'ouverture du meeting
      est immédiate, et n'a pas de date de fermeture.

### Valeurs de retours

Succès :

    - 201 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à créer un meeting ;

    - 409 { "error": "conflict" } : le meeting existe déjà.


## Modifier un meeting

### URL

    POST /meeting/{org}/all/{meeting}

### Parametres

Dans l'URL :

    - org:              Organisation.                               af83
    - meeting:          Meeting.                                    demo

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

Encodés (optionels) :

    - _start   Date et heure d'ouverture du meeting.       63444430100
    - _end     Date et heure de fermeture du meeting.      63444430800
    - metadata :	Tableau contenant les métadonnés (ex. metadata[key]=value).

### Valeurs de retours

Succès :

    200 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à supprimer le meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.


## Liste des utilisateurs connectés au meeting (roster)

### URL

    GET /meeting/{org}/all/{meeting}/roster

### Parametres

Dans l'URL :

    - org:              Organisation.       af83
    - meeting:          Meeting.            demo

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

### Valeurs de retours

Succès :

200 {"result":[{	"uid":"abel.fournier_1284046072075@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284046072075"}
			},
               {	"uid":"abel.fournier_1284107725374@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284107725374"}
			},
	       {	"uid":"abel.fournier_1284114120882@af83.com",
			"auth":"password",
			"metadata":{
				"nickname":"abel_1284114120882"}
	       },
	       ...
]}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à lister les
					utilisateur de ce meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.

## Liste des meetings

### URL

    GET /meeting/{org}

    GET /meeting/{org}/{status}

### Parametres

Dans l'URL :

    - org:          Organisation.           af83

Dans l'URL (optionel) :

    - status:       Status du meeting.      upcoming | opened | closed | all

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

### Valeurs de retour

Succès:

    200 {"result":[{	"org":"af83",
			"name":"demo",
			"start_date":1284046056927,
			"end_date":"never",
			"roster":[	"abel.fournier_1284046072075@af83.com",
					"abel.fournier_1284107725374@af83.com"],
			"metadata":{	"description":"UCengine demo meetup"}
		},
		{	"org":"af83",
			"name":"demo2",
			"start_date":1284046056928,
			"end_date":"never",
			"roster":[],
			"metadata":{"description":"Meeting R&D"}
		},
		{	"org":"af83",
			"name":"agoroom",
			"start_date":1284046056928,
			"end_date":1284046056928,
			"roster":["blah4"],
			"metadata":{"description":"Meeting agoroom"}
		}
]}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à lister les
					meetings de cette organisation ;

    - 404 { "error": "not_found" } : l'organisation n'existe pas.

## Récupérer les informations d'un meeting

### URL

    GET /meeting/{org}/all/{meeting}

### Parametres

Dans l'URL :

    - org:          Organisation.           af83
    - meeting:          Meeting.            demo

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

### Valeurs de retour

Succès:

    200 {"result":{	"org":"af83",
			"name":"demo",
			"start_date":1284046056927,
			"end_date":"never",
			"roster":[	"abel.fournier_1284046072075@af83.com",
					"abel.fournier_1284107725374@af83.com"],
			"metadata":{	"description":"UCengine demo meetup"}
		}}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à lister les
					meetings de cette organisation ;

    - 404 { "error": "not_found" } : l'organisation n'existe pas.

## Supprimer un meeting

### URL

   DELETE /meeting/{org}/all/{meeting}

### Parametres

Dans l'URL :

    - org:              Organisation.                               af83
    - meeting:          Meeting.                                    demo

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

### Valeurs de retours

Succès :

    200 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à supprimer le meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.

# Evènements
## Récupérer la liste des événements

### URL

    GET /event/

    GET /event/{org}/

    GET /event/{org}/{meeting}

### Parametres

Dans l'URL :

    - org:          Organisation.           af83
    - meeting:      Meeting.                demo

Dans l'URL (optionels) :

Encodés :

    - uid:             Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:             Identifiant de presence.               330249245470504

Encodés (optionels) :

    - _type:         Type de l'événement.				join_meeting_event
    - _start		Début de la fenêtre d'événements.           63444430100
    - _end		Fin de la fenêtre d'événements.             63444430300
    - _from		Émetteur de l'évènement			     uid_63444326443_50150
    - _limit		Nombre d'évènement à retourner			42
    - _wait		Temps maximum à attendre en seconde (defaut: 0)		42

### Valeurs de retour

Succès :

    200 {"result": [{	"type":"join_meeting_event",
			"datetime":1284046079374,
			"id":"24653994823933231622695570265810",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{}
		},
		{	"type":"post_annotation_event",
			"datetime":1284046082844,
			"id":"20196912711920626263917946711292",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{	"language":"fr",
					"text":"coucou"}
		},
		{	"type":"translate_annotation_event",
			"datetime":1284046083272,
			"id":"61614248092678409569587739330424",
			"org":"af83",
			"meeting":"demo",
			"from":"abel.fournier_1284046072075@af83.com",
			"metadata":{	"traduction":"cuckoo",
					"language":"en"}
		},
		...
]}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à lister les
					évènements de ce meeting ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.

### Remarques

'_start' et '_end' permettent de fenêtrer les événements à récuperer :

- Si '_end' est absent : récupère tous les événements à partir de
  timestamp_start jusqu'à la fin de la timeline.
- Si '_start' et '_end' sont absents : récupère tous les événements de la timeline.
- L'option _limit peut prendre être négative, auquel cas la méthode retournera le
	nombre d'évènement indiqué depuis la fin de la liste. Par exemple _limit=-2 retournera
	les deux derniers évènements. Il est possible de mettre _limit à "last", ceci-est
	équivalent à _limit=-1.
- L'option _wait permet l'envoie de messages au client en temps réel en utilisant
	la technique du long-polling. Il suffit d'utilisé cette option _wait
	couplé avec _start pour obtenir une boucle active de réception des
	messages.

## Envoyer un événement à UCengine

## URL

    PUT /event/
    PUT /event/{org}
    PUT /event/{org}/{meeting}

## Parametres

Dans l'URL :

    - org:              Organisation.                                     af83
    - meeting:          Meeting.                                          demo

Encodés :

    - uid:         Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:         Identifiant de presence.               330249245470504
    - _type:	     Type de l'événement.			join_meeting_event
    - Tout les autres parametres encodés sont placé dans les métadonnés.

Succès :

    - 201 {"result": "24653994823933231622695570265810"}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à envoyer des
					évènements sur ce meeting ou cette organisation ;

    - 404 { "error": "not_found" } : le meeting ou l'organisation n'existe pas.

# Organisation
## Créer une nouvelle organisation

### URL

    PUT /org/{name}

### Parametres

Dans l'URL :

    - name:         Nom de la nouvelle organisation.            af83

Encodés :

    - uid:         Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:         Identifiant de presence.               330249245470504
    - Tout les autres parametres encodés sont placé dans les métadonnés.

### Valeurs de retour

Succès :

    - 201 { "result": "created" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à créer des organisations ;

    - 409 { "error": "conflict" } : l'organisation existe déjà.

## Modifier une organisation

### URL

    POST /org/{name}

### Parametres

Dans l'URL :

    - name:         Nom de l'organisation.            af83

Encodés :

    - uid:         Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:         Identifiant de presence.               330249245470504
    - Tout les autres parametres encodés sont placé dans les métadonnés.

### Valeurs de retour

Succès :

    200 { "result": "ok" }

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à créer des organisations ;

    - 404 { "error": "not_found" } : l'organisation n'existe pas.

## Récupérer les informations d'une organisation

### URL

    GET /org/{name}

### Parametres

Dans l'URL :

    - name:         Nom de l'organisation.            af83

Encodés :

    - uid:         Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:         Identifiant de presence.               330249245470504

### Valeurs de retour

Succès :

    200 { "result": {	"name": "af83",
			"metadata":{
				"description": "Crazy Solid"
			}
	}}

Erreur :

    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à créer des organisations ;

    - 404 { "error": "not_found" } : l'organisation n'existe pas.

## Lister les organisation

### URL

    GET /org/

### Parametres

Encodés :

    - uid:         Identifiant de l'utilisateur.         uid_63444326443_50150
    - sid:         Identifiant de presence.               330249245470504

### Valeurs de retour

Succès :

    200 { "result": [{	"name": "af83",
			"metadata":{
				"description": "Crazy Solid"
			},
		    {	"name": "google",
			"metadata":{
				"is_evil", "no"
			}
		    },
		    ...
	}]}

# Fichiers
## Uploader un fichier

### URL

    PUT /file/{org}/{meeting}

    PUT /file/{org}/{meeting}/{filename}

### Parametres

Dans l'URL :

    - org:          Organisation.                           af83
    - meeting:      Meeting.                                demo

Dans l'URL (optionels) :

    - filename:     Nom du fichier.                         ucengine.odp

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

Encodés (optionels) :

    - _filename:  Nom du fichier	                 ucengine.odp

### Valeurs de retour

Succès :

    - 201 { "result": "ucengine_4534543543.odp"}

Erreur :
    - 400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    - 401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à créer des organisations ;

    - 404 { "error": "not_found" } : le meeting n'existe pas.

### Remarques

- Il est possible de spécifier le nom du fichier en passant le parametre dans l'url,
dans le corps de la requète ou dans les donnés du corps de la requète (ce dernier cas
est généralement géré automatiquement par le navigateur).
- Pour éviter les conflits entre les fichiers UCengine génère un identifiant de fichier aléatoire
 retourné par la requete.

## Lister les fichiers

### URL

    GET /file/{org}/{meeting}

### Parametres

Dans l'URL :

    - org:          Organisation.                           af83
    - meeting:      Meeting.                                demo

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

    200 { "result": [ { "filename": "UCengine.odp"
                      , "token": "42314657480629893636680972"
                      , "description": "Présentation du projet UCengine"
                      }
                    , ...
                    ]}

Erreur :

    401 { "error": "unauthorized" }

    500 { "error": "unexpected_error" }

## Récupérer un fichier

### URL

    GET /file/{org}/{meeting}/{filename}

### Parametres

Dans l'URL :

    - org:          Organisation.                           af83
    - meeting:      Meeting.                                demo
    - filename:     Nom du fichier.                         UCengine.odp

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504

### Valeurs de retour

Succès :

    200 Le fichier à télécharger

Erreur :

    401 { "error": "unauthorized" }

    404 { "error": "not_found" }

    500 { "error": "unexpected_error" }


## Vérifier les droits d'un utilisateur

### URL

    GET /user/{uid}/acl/{object}/{action}

### Parametres

Dans l'URL :

    - uid:         Identifiant de l'utilisateur.     uid_42
    - object:      Object sur lequel s'applique le droit.       meeting, org, event, ...
    - action:      Action authorisée par le droit.              add, delete, join, ...

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504
    - conditions:  Tableau contenant les conditions à satisfaire pour ce droit.

### Exemples

Si l'utilisateur 'romain' veut vérifier que un utilisateur 'toto' à le droit de rejoindre le meeting 'ucengine' de l'organisation 'af83' la requête sera :

Chemin : GET /user/toto/acl/meeting/join
Parametres:
        - uid=romain
        - sid=40324302840329843809543
        - conditions[org]=af83
        - conditions[meeting]=ucengine

### Valeurs de retour

Succès :

    200 {"result": "true"} :

    200 {"result": "false"}

Erreur :

    400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à vérifier les droits de cet utilisateur;

    404 { "error": "not_found" } : l'utilisateur n'existe pas

## Ajouter un droit à un utilisateur

### URL

    PUT /user/{uid}/acl/{object}/{action}

### Parametres

Dans l'URL :

    - uid:         Identifiant de l'utilisateur.     uid_42
    - object:      Object sur lequel s'applique le droit.       meeting, org, event, ...
    - action:      Action authorisée par le droit.              add, delete, join, ...

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504
    - conditions:   tableau contenant les conditions à satisfaire pour effectuer l'action sur l'object.

### Valeurs de retour

Succès :

    201 { "result": "ok" } : le droit à été correctement ajouté.

Erreur :

    400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à ajouter un droit de cet utilisateur;

    401 { "error": "not_found" } : l'utilisateur n'existe pas

## Supprimer un droit à un utilisateur

### URL

    DELETE /acl/{uid}/{domain}

### Parametres

Dans l'URL :

    - uid:         Identifiant de l'utilisateur.     uid_42
    - object:      Object sur lequel s'applique le droit.       meeting, org, event, ...
    - action:      Action authorisée par le droit.              add, delete, join, ...

Encodés :

    - uid:         Identifiant de l'utilisateur.     uid_63444326443_50150
    - sid:         Identifiant de presence.           330249245470504
    - conditions:   tableau contenant les conditions à satisfaire pour effectuer l'action sur l'object.

### Valeurs de retour

Succès :

    200 { "result": "ok" } : le droit à été correctement supprimé.

Erreur :

    400 { "error": "bad_parameters" } : au moins un paramètre est manquant ou erroné ;

    401 { "error": "unauthorized" } : l'utilisateur n'est pas authorisé à supprimer un droit de cet utilisateur;

    404 { "error", "not_found" } : l'utilisateur n'existe pas.

