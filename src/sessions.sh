#
# Function to display logged in users and their IP addresses.
#
function userSessions () {
    # Get logged in users from tty entry:
    # echo -e -n "$Dim[Sessions]"
    # (NR>2) tells awk to skip two header lines
    # sort  and  uniq  to remove duplicate users
    # last sed is to trim/prevent printing whitespaces
    local TTY_USERS=$(w | awk '(NR>2) { print $1 }' | sort | uniq | sed '/^[[:space:]]*$/d')

    # Using echo here to print mutiline stdout in a single line via flags: -n and -e
    # To handle a multi-user log in situation. More than one IP will be sent out to stdout from the 'w' command.
    # ->> awk explanation: skip two headers, print third column, sort, get unique IPs, trim space lines
    local TTY_IP=$(echo -n -e "$(w | awk '(NR>2) { print $3 }' | sort | uniq | sed '/^[[:space:]]*$/d')")

    echo -e -n "$ColorReset""➜ [$Bold$Dim$ColorReset$Normal$Blue $TTY_USERS$ColorReset$Dim from $Blue$TTY_IP$ColorReset ]"
}
