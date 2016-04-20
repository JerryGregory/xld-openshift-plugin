<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
# login to openshift and switch projects
${deployed.container.ocHome}/oc login --server=${previousDeployed.container.serverUrl} -u ${previousDeployed.container.username} -p ${previousDeployed.container.password} --insecure-skip-tls-verify=true
${deployed.container.ocHome}/oc project ${previousDeployed.project}

${deployed.container.ocHome}/oc delete service ${previousDeployed.projectName}