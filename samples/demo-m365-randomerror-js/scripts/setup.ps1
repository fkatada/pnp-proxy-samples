# login
Write-Output "Sign in to Microsoft 365..."
npx -p @pnp/cli-microsoft365 -- m365 login --authType browser

# create AAD app
Write-Output "Creating AAD app..."
$appId = npx -p @pnp/cli-microsoft365 -- "m365 aad app add --name dev-proxy-samples --multitenant --redirectUris http://localhost:3000/withsdk.html,http://localhost:3000/nosdk.html --apisDelegated https://graph.microsoft.com/User.Read.All,https://graph.microsoft.com/Presence.Read.All --grantAdminConsent --platform spa --query appId -o text"

Write-Output "AppId: $appId"

# write app to env.js
Write-Output "Writing app to env.js..."
"const appId = '$appId';" | Out-File .\env.js

Write-Output "DONE"
