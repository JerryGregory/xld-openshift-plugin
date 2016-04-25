<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->


# login to openshift and switch projects
${deployed.container.ocHome}/oc login --server=${deployed.container.serverUrl} -u ${deployed.container.username} -p '${deployed.container.password}' --insecure-skip-tls-verify=true
${deployed.container.ocHome}/oc project ${deployed.project}

echo "delete app ${deployed.appName}"
${deployed.container.ocHome}/oc delete all -l app=${deployed.appName}

echo "create new app ${deployed.appName}"
${deployed.container.ocHome}/oc new-app <#if deployed.dockerUrl?has_content>${deployed.dockerUrl}/</#if><#if deployed.dockerOrganization?has_content>${deployed.dockerOrganization}/</#if>${deployed.dockerName}<#if deployed.dockerTag?has_content>:${deployed.dockerTag}</#if> --name=${deployed.appName}
${deployed.container.ocHome}/oc expose service ${deployed.appName}
${deployed.container.ocHome}/oc status
