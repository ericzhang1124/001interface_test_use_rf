***Settings***
| Documentation  | 接口自动化测试初级练习测试 |
| Library        | RequestsLibrary |
**Test Cases***

A easy case
|  | [Documentation] | 一个简单的case |
|  | Create Session | api | http://localhost:8000 |
|  | ${addr}   | Get Request |  api | users/1 |
|  | Should Be Equal As Strings  | ${addr.status_code} |  200 |
|  | Log  | ${addr.content} |
|  | ${responsedata} | To Json | ${addr.content} |
|  | ${keys} | Get Dictionary Keys | ${responsedata} |
|  | ${items} | Get Dictionary Items | ${responsedata} |
|  | ${values} | Get Dictionary Values | ${responsedata} |
|  | ${str} | Get From Dictionary | ${responsedata} | 1 |
|  | ${addr} | Get Request | api | users/5 |
|  | Should Be Equal As Strings | ${addr.status_code} | 404 |
|  | Log | ${addr.content} |
|  | ${responsedata} | To Json | ${addr.content} |
|  | ${keys} | Get Dictionary Keys | ${responsedata} |
|  | ${items} | Get Dictionary Items | ${responsedata} |
|  | ${values} | Get Dictionary Values | ${responsedata} |
|  | ${str} | Get From Dictionary | ${responsedata} | message |
|  | Delete All Sessions |