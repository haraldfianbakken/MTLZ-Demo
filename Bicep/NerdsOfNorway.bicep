param mspOfferName string = 'NerdsOfNorway'
param mspOfferDescription string = 'This is the ultimate MSP'
param managedByTenantId string = '20292530-b1ac-401d-be5c-24bc04a19791'
param authorizations array = []

var mspRegistrationName = guid(mspOfferName)
var mspAssignmentName = guid(mspOfferName)

resource registrationDef 'Microsoft.ManagedServices/registrationDefinitions@2019-09-01' = {
    name: mspRegistrationName    
    properties: {
        registrationDefinitionName : mspOfferName
        description : mspOfferDescription
        managedByTenantId: managedByTenantId
        authorizations: authorizations
    }
}
resource registrationAssignment 'Microsoft.ManagedServices/registrationAssignments@2019-09-01' = {
    name: mspAssignmentName    
    properties: {
        registrationDefinitionId: registrationDef.id
    }    
}

output mspOfferNameOut string = 'Managed by ${mspOfferName}'
output authorizationsOut array = authorizations