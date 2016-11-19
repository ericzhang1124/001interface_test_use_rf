***Settings***
| Documentation  | 接口自动化测试初级练习测试 |
| Library        | RequestsLibrary |
| Library | Collections |
| Library | XML |

**Test Cases***
A easy case of Json Data
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

A easy case of XML Data
|  | [Documentation] | 一个响应数据为XML格式的case |
|  | #XML 转 JSON 方式 |
|  | Create Session | api | http://localhost:8000 |
|  | ${addr} | Get Request | api | hello/qitao |
|  | Comment | Should Be Equa As Strings | ${addr.status_code} | 200 |
|  | Log | ${addr.content} |
|  | ${responsedata} | To Json | ${addr.content} |
|  | ${keys} | Get Dictionary Keys | ${responsedata} |
|  | ${items} | Get Dictionary Items | ${responsedata} |
|  | ${values} | Get Dictionary Values | ${responsedata} |
|  | ${str} | Get From Dictionary | ${responsedata} | hello |

|  | #XML 格式 |
|  | ${dict} | Create Dictionary | accept=application/xml |
|  | ${addr} | Get Request | api | hello/qitao | ${dict} |
|  | Comment | Should Be Equa As Strings | ${addr.status_code} | 200 |
|  | Log | ${addr.content} |
|  | ${responsedata} | Set Variable | ${addr.content} |
|  | ${body} | Get Element Text | ${responsedata} | hello |
|  | ${hello} | Get Element | ${responsedata} | hello |
|  | Log | ${hello.text} |
|  | ${responsedata} | Add Element | ${responsedata} | <new id="3">test</new> |
|  | ${new} | Get Element Attribute | ${responsedata} | id | new |
|  | Log | ${new} |
|  | ${a} | Element To String | ${responsedata} |
|  | Delete All Sessions |

A easy case of get method with auto login
|  | #用户密码 |
|  | ${auth} | Create List | ok | python |
|  | Create Session | api | http://localhost:8000 | | | ${auth} |
|  | ${addr} | Get Request | api | 401 |
|  | Comment | Should Be Equal As Strings | ${addr.status_code} | 200 |
|  | Log | ${addr.content} |
|  | ${responsedata} | To Json | ${addr.content} |
|  | ${keys} | Get Dictionary Keys | ${responsedata} |
|  | ${items} | Get Dictionary Items | ${responsedata} |
|  | ${values} | Get Dictionary Values | ${responsedata} |
|  | ${str} | Get From Dictionary | ${responsedata} | pass |
|  | Delete All Sessions |
