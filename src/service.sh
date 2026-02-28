#
# Function to display the status of a given service using systemctl.
#
function serviceStatus () {

    # first of all ceck if unit exists!
    if ! systemctl status "$1" >/dev/null 2>&1; then
        echo -e -n "$ColorReset""➜ [$Bold$Blue $1$ColorReset$Normal $Yellow⁇$ColorReset$Dim not found ] "
        return
    fi

    local IS_ACTIVE=$(systemctl is-active "$1")
    local IS_UP=$(systemctl show -p SubState --value "$1")
    if [ "$IS_ACTIVE" = "active" ] ; then
    echo -e -n "$ColorReset""➜ [$Bold$Blue $1$ColorReset$Normal $Green✓$ColorReset$Dim active "

        case $IS_UP in
            "running") echo -e -n "$Green▲$ColorReset$Dim up$Normal$ColorReset ]" ;;
            "dead") echo -e -n "$Red▼$ColorReset$Dim down$ColorReset ]" ;;
            *) echo -e -n "Error loading service" ;;
        esac

    elif [ "$IS_ACTIVE" = "inactive" ] ; then
        echo -e -n "$ColorReset""➜ [$Bold$Blue $1$ColorReset$Normal $Red ✗ $ColorReset inactive ] "

    else
        # might not need this one given the status check above
        echo -e -n "$ColorReset""➜ [$Bold$Blue $1$ColorReset$Normal $Yellow ● $ColorReset no status! ] "
    fi
}
