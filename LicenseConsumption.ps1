$Skus = Get-AzureADSubscribedSku
$LicenseList = @()


$LicenseLookup = @{
    VISIOCLIENT = 'Visio Online Plan 2'
    STREAM = 'Micrsoft Stream Trial'
    EMSPREMIUM = 'Enterprise Mobility + Security E5'
    ENTERPRISEPREMIUM = 'Office 365 Enterprise E5'
    POWER_BI_INDIVIDUAL_USER = 'Power BI - deprecated, use Power BI (free) instead​'
    POWER_BI_PRO = 'Power BI Pro' 
    SPZA_IW = 'App Connect'
    WINDOWS_STORE = 'Windows Store'
    ENTERPRISEPACK = 'Office 365 Enterprise E3'
    FLOW_FREE = 'Microsoft Flow Free'
    POWERAPPS_VIRAL = 'Microsoft PowerApps Plan 2 Trial'
    MS_TEAMS_IW = 'Microsoft Teams Trial'
    DYN365_ENTERPRISE_PLAN1 = 'Dynamics 365 Customer Engagement Plan'
    POWER_BI_STANDARD = 'Power BI Free'
    SHAREPOINTDESKLESS = 'SharePoint Online Kiosk'
    EMS = 'Enterprise Mobility + Security E3'
    AAD_PREMIUM = 'Azure Active Directory Premium P1'
    PROJECTPROFESSIONAL = 'Project Online Professional'
    RIGHTSMANAGEMENT_ADHOC = 'Rights Management Adhoc'
    STANDARDPACK = 'Office 365 Enterprise E1'
    DYN365_AI_SERVICE_INSIGHTS = 'Dynamics 365 AI for Customer Service Trial'
    }



Foreach ($Sku in $Skus) 
{
    $LicenseDetails = [PSCustomObject]@{
    
    License = $licenselookup[($Sku.SkuPartNumber)]
    PurchasedLicenses = ($Sku.PrepaidUnits).enabled
    AssignedLicenses = $Sku.ConsumedUnits
    AvailableLicenses = (($Sku.PrepaidUnits).enabled) - ($Sku.ConsumedUnits)
    }
    $LicenseList += $LicenseDetails

}

$LicenseList
