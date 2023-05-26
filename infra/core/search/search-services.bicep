param name string
param location string = resourceGroup().location
param tags object = {}

param sku object = {
  name: 'standard'
}

resource search 'Microsoft.Search/searchServices@2021-04-01-preview' = {
  name: name
  location: location
  sku: sku
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }

  tags: tags
}

output id string = search.id
output endpoint string = 'https://${name}.search.windows.net/'
output name string = search.name
