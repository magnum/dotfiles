#!/bin/bash

# cf. http://www.macos.utah.edu/documentation/authentication/dscl.html

# networksetup -removepreferredwirelessnetwork airport kmisz

if [[ "$(/usr/bin/whoami)" != "root" ]]; then printf '\nMust be run as root!\n\n'; 	exit 1; fi

OPATH=$PATH
export PATH=/usr/bin:/usr/sbin:/bin:/sbin

OIFS=$IFS
export IFS=$' \t\n'

declare sudo=/usr/bin/sudo

# read user

for user in "$@"; do
	printf "\e[1mDelete user account\e[m:$user"

	if [[ -z "$user" ]]; then printf '\nNo user specified! Please, try again!\n\n'; exit 1; fi

	# make sure the user exists
	usertest="$(/usr/bin/dscl . -search /Users name "$user" 2>/dev/null)"
	
        if [[ -z "$usertest" ]]; then printf "\nUser does not exist: $user\n\n"; exit 1; fi
	user="$(/usr/bin/dscl . -read /Users/"$user" RecordName | /usr/bin/awk '{print $NF;}')"
	printf "($user)\n";


	# get user's group memberships
	groups_of_user="$(/usr/bin/id -Gn "$user")"

	if [[ $? -eq 0 ]] && [[ -n "$(/usr/bin/dscl . -search /Groups GroupMembership "$user")" ]]; then 
	   # delete the user's group memberships
	   for group in $groups_of_user; do
		  $sudo /usr/bin/dscl . -delete "/Groups/$group"  GroupMembership "$user"
		  printf "delete group membership of $user"
		  #$sudo /usr/sbin/dseditgroup -o edit -d "$user" -t user "$group"           
	   done
	fi


	# delete the user's primary group, be careful not to delete the admin group!
	lowerUser="$(/bin/echo "$user" | tr '[:upper:]' '[:lower:]')"
	#printf "My God: "$lowerUser""
	if [[ "$lowerUser" != 'admin' ]]; then 
		# printf "delete private group of "$user"\n"; 
		if [[ -n "$(/usr/bin/dscl . -search /Groups name "$user")" ]]; then
		   $sudo /usr/sbin/dseditgroup -o delete "$user"
		   # printf "___delete "$user""
		fi
	fi
	# find the GeneratedUID of the user and remove the password hash file 
	# from /private/var/db/shadow/hash/<GeneratedUID>
	# sudo ls -a /private/var/db/shadow/hash
	# sudo ls -l /private/var/db/shadow/hash/<GeneratedUID>

	guid="$(/usr/bin/dscl . -read "/Users/$user" GeneratedUID | /usr/bin/awk '{print $NF;}')"

	if [[ -f "/private/var/db/shadow/hash/$guid" ]]; then
	   $sudo /bin/rm -f /private/var/db/shadow/hash/$guid
	fi


	# delete the user
	$sudo /usr/bin/dscl . -delete "/Users/$user"

	# make a backup
	#if [[ -d "/Users/$user" ]]; then
	#   $sudo /usr/bin/ditto -rsrc -c -k "/Users/$user" "/Users/${user}-archive-$(/bin/date).zip"
	#fi

	# remove the user's home directory
	if [[ -d "/Users/$user" ]]; then
	   $sudo /bin/rm -rf "/Users/$user"
	fi
done

export IFS=$OIFS
export PATH=$OPATH

exit 0
