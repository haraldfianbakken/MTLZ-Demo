param mspOfferName string = 'NerdsOfNorway'
param mspOfferDescription string = 'This is the ultimate MSP'
param managedByTenantId string = '20292530-b1ac-401d-be5c-24bc04a19791'
param authorizations array = [
    {
        principalId: 'b641010a-c528-49dc-abbc-beeb9f05c808'
        principalIdDisplayName: 'Tier 1 Support' 
        roleDefinitionId: 'b24988ac-6180-42a0-ab88-20f7382dd24c'
    }
    {
        principalId: '262d3e8b-a1cc-45ea-944c-112dd735169c'
        principalIdDisplayName: 'Automation Account - Full access'
        roleDefinitionId: '18d7d88d-d35e-4fb5-a5c3-7773c20a72d9'
        delegatedRoleDefinitionIds: [
            'b24988ac-6180-42a0-ab88-20f7382dd24c'
            '92aaf0da-9dab-42b6-94a3-d43ce8d16293'
            '91c1777a-f3dc-4fae-b103-61d183457e46'
        ]
    }             
]

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