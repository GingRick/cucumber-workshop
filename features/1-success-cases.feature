@success_cases

Feature:
	I want to verify that the service is responding ok!

	@POST_info_socios   
    Scenario: Envio de una llamada exitosa
        Given I set body to {"dinHeader":{"aplicacionID":"TCHNSY","canalID":"IN","uuid":"4A1B43E2-1183-4AD4-A3DE","ip":"192.168.1.2","horaTransaccion":"2011-01-01T15:03:01","nivelTrace":"DEBUG","nombreServicio":" MetodosContacto"},"MetodosContacto":{"entidad":"PI","marca":"VI","identificacionUsuario":"1707254718","tipoDocumento":"1","codigoServicio":"1268","codigoCanal":"0000001"}}
        And I set Content-Type header to application/json
        When I POST to /InformacionSocios
        Then response code should be 200
        And response body should be valid json
		And response body path $.dinHeader.aplicacionID should be TCHNSY
        And response body path $.dinHeader.canalID should be IN
        And response body path $.dinHeader.uuid should be 4A1B43E2-1183-4AD4-A3DE
        And response body path $.dinHeader.ip should be 192.168.1.2
        And response body path $.dinHeader.nivelTrace should be DEBUG
        And response body path $.dinHeader.nombreServicio should be MetodosContacto
        And response body path $.MetodosContactoResponse.listaContactos.contactos[0].metodo should be C
        And response body path $.MetodosContactoResponse.listaContactos.contactos[0].contacto should be 0992587484
        And response body path $.MetodosContactoResponse.listaContactos.contactos[1].metodo should be T
        And response body path $.MetodosContactoResponse.listaContactos.contactos[1].contacto should be 022254114
        And response body path $.MetodosContactoResponse.listaContactos.contactos[2].metodo should be M
        And response body path $.MetodosContactoResponse.listaContactos.contactos[2].contacto should be IBM1757358A@DINERSCLUB.COM.EC
		
		