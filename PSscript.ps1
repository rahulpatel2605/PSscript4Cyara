# Import the requests module
Import-Module requests

# Define the execute_campaign function
function execute_campaign($account_id, $campaign_id) {
    $url = "https://www.cyaraportal.us/CyaraWebApi/swagger/index.html?url=/CyaraWebApi/swagger/v3.0/accounts/$account_id/campaigns/$campaign_id/execute"
    $response = Invoke-RestMethod -Method Post -Uri $url
    if ($response.StatusCode -eq 200) {
        return $response.Content | ConvertFrom-Json
    } else {
        throw "Failed to execute campaign"
    }
}

# Define the get_campaign_run_results function
function get_campaign_run_results($account_id, $campaign_id, $campaign_run_id) {
    $url = "https://www.cyaraportal.us/CyaraWebApi/swagger/index.html?url=/CyaraWebApi/swagger/v3.0/accounts/$account_id/campaigns/$campaign_id/runs/$campaign_run_id"
    $response = Invoke-RestMethod -Method Get -Uri $url
    if ($response.StatusCode -eq 200) {
        return $response.Content | ConvertFrom-Json
    } else {
        throw "Failed to get campaign run results"
    }
}

# Set the account ID, campaign ID, and campaign run ID
$account_id = "123456"
$campaign_id = "789012"

# Execute the campaign
$campaign_results = execute_campaign $account_id $campaign_id

# Get the campaign run results
$run_results = get_campaign_run_results $account_id $campaign_id $campaign_run_id

# Print the results
Write-Host "Campaign results:" $campaign_results
Write-Host "Run results:" $run_results
