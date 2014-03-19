<?php 

/**
 * General error messages.
 * 
 * @author Adrodev GmbH
 * @package EnBW_RESTful_API
 */
class ErrorMessages {

	const NO_CONNECTION 			= "Verbindung zum SQL-Server nicht m&ouml;glich";
	const NO_AUTHORIZATION			= "Die Authentifizierung ist fehlgeschlagen";
	const METHOD_NOT_FOUND			= "Die Methode wurde nicht gefunden";
	const UTF8_NOT_SUPPORTED		= "UTF8 wird von ihrer Datenbank nicht unterst&uuml;tzt";
	const ENTRY_NOT_FOUND			= "Der Eintrag wurde nicht gefunden";
	const NO_VALID_DATA				= "Die Daten sind ung&uuml;ltig";
	const NOT_IMPLEMENTED			= "Funktion nicht implementiert";
	const GENERAL_ERROR				= "Genereller Fehler";
	const DB_QUERY_ERROR			= "Fehler bei Datenbankabfrage: ";
	
}

?>