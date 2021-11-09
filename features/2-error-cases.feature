@error_cases

Feature:
	I want to verify that the service is responding ok!

	@POST_info_socios_property_too_long
    Scenario: Envio de una llamada con una propiedad en el json que excede el largo.
        Given I set body to {"dinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeaderdinHeader":{"aplicacionID":"TCHNSY","canalID":"IN","uuid":"4A1B43E2-1183-4AD4-A3DE","ip":"192.168.1.2","horaTransaccion":"2011-01-01T15:03:01","nivelTrace":"DEBUG","nombreServicio":" MetodosContacto"},"MetodosContacto":{"entidad":"PI","marca":"VI","identificacionUsuario":"1707254718","tipoDocumento":"1","codigoServicio":"1268","codigoCanal":"0000001"}}
        And I set headers to
        | name          | value            |
        | Content-Type  | application/json |
        | User-Agent    | apickli          |
        When I POST to /InformacionSocios
        Then response code should be 500
        And response body should be valid json
        And response body path $.fault.detail.errorcode should be steps.jsonthreatprotection.ExecutionFailed
    

    @POST_info_socios_unauthorized
    Scenario: Envio de una llamada con un token invalido.
        Given I set body to {"dinHeader":{"aplicacionID":"TCHNSY","canalID":"IN","uuid":"4A1B43E2-1183-4AD4-A3DE","ip":"192.168.1.2","horaTransaccion":"2011-01-01T15:03:01","nivelTrace":"DEBUG","nombreServicio":" MetodosContacto"},"MetodosContacto":{"entidad":"PI","marca":"VI","identificacionUsuario":"1707254718","tipoDocumento":"1","codigoServicio":"1268","codigoCanal":"0000001"}}
        And I set headers to
        | name          | value            |
        | Content-Type  | application/json |
        | User-Agent    | apickli          |
        | Authorization | Bearer j0SXAMKDKxIcmoABIsANToU3xQk8 |
        When I POST to /InformacionSocios
        Then response code should be 401
        And response body should be valid json
        And response body path $.fault.faultstring should be Invalid Access Token
        And response body path $.fault.detail.errorcode should be keymanagement.service.invalid_access_token
    

    @POST_info_socios_no_payload
    Scenario: Envio de una llamada sin payload.
        Given I set headers to
        | name          | value            |
        | Content-Type  | application/json |
        | User-Agent    | apickli          |
        When I POST to /InformacionSocios
        Then response code should be 400
        And response body should be valid json
        And response body path $.ok should be false
        And response body path $.description should be You need a json payload
        And response body path $.docs should be https://apimarket.dinersclub.tech.ec/