# Copyright 2016 Centrify Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function AddResource {
    param(
        [Parameter(Mandatory=$true)]
        $endpoint,
        [Parameter(Mandatory=$true)]
        $bearerToken,
        [Parameter(Mandatory=$true)]
        $Name,
        [Parameter(Mandatory=$true)]
        $FQDN,
        [Parameter(Mandatory=$true)]
        $ComputerClass,
        [Parameter(Mandatory=$true)]
        $SessionType,
        [Parameter(Mandatory=$true)]
        $Description
              
    )
	
    $restArg = @{}
    $restArg.Name = $Name
    $restArg.FQDN = $FQDN
    $restArg.ComputerClass = $ComputerClass
    $restArg.SessionType = $SessionType
    $restArg.Description = $Description
	
    $restResult = Centrify-InvokeREST -Method "/ServerManage/AddResource" -Endpoint $endpoint -Token $bearerToken -ObjectContent $restArg -Verbose:$enableVerbose
    if($restResult.success -ne $true)
    {
        throw "Server error: $($restResult.Message)"
    }     
    
    return $restResult.Result		    
}
