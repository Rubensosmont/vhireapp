class CustomError {

  final String code;
  final String msg;
  late String message;

  CustomError(this.code, this.msg) {

    switch(code) {
      case 'channel-error':
        message = "Erreur de connection.";
        break;
      case 'email-already-exists' || 'email-already-in-use':
        message = "L'adresse e-mail fournie est déjà utilisée par un utilisateur existant.";
        break;
      case 'id-token-expired':
        message = "Le jeton d'identification Firebase fourni a expiré.";
        break;
      case 'id-token-revoked':
        message = "Le jeton d'identification Firebase a été révoqué.";
        break;
      case 'insufficient-permission':
        message = "Permissions insuffisantes.";
        break;
      case 'invalid-argument':
        message = "Un argument non valide a été fourni à une méthode d'authentification.";
        break;
      case 'invalid-credential':
        message = "Les informations d'identification utilisées sont incorrects.";
        break;
      case 'invalid-email':
        message = "L'email n'est pas valide.";
        break;
      case 'invalid-id-token':
        message = "Le jeton d'identification fourni n'est pas un jeton d'identification Firebase valide.";
        break;
      case 'invalid-password' || 'weak-password':
        message = "Le mot de passe n'est pas valide. Il faut au moins six caractères.";
        break;
      case 'invalid-photo-url':
        message = "La valeur fournie comme URL de la photo n'est pas valide.";
        break;
      case 'invalid-provider-data':
        message = "Le providerData doit être un tableau valide d'objets UserInfo.";
        break;
      case 'invalid-provider-id':
        message = "Le providerId doit être une chaîne d'identifiant de fournisseur prise en charge valide.";
        break;
      case 'invalid-uid':
        message = "L' uid fourni doit être une chaîne non vide d'au plus 128 caractères.";
        break;
      case 'user-not-found':
        message = "Aucun enregistrement d'utilisateur existant ne correspond à l'identifiant fourni.";
        break;
      case 'network-request-failed':
        message = "Erreur liée à la connexion internet.";
        break;
      case 'user-not-found':
        message = "L'utilisateur n'a pas été trouvé.";
        break;
      case 'object-not-found':
        message = "L'URL de l'objet fourni est incorrect.";
        break;
      default:
        message = msg;
    }

  }

}