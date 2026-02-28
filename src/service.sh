#
# Function to display the status of a given service using systemctl.
#
function serviceStatus () {

    local UNIT="$1"
    [[ "$UNIT" != *.service ]] && UNIT="$UNIT.service"

    # Check if unit actually exists
    if ! systemctl cat "$UNIT" >/dev/null 2>&1; then
        print "$ColorReset""➜ [$Bold$Blue $1$ColorReset$Normal $Yellow⁇$ColorReset$Dim not found$ColorReset] "
        return
    fi

    local IS_ACTIVE=$(systemctl is-active "$UNIT")

    local IS_UP=$(systemctl show -p SubState --value "$UNIT")

    if [[ "$IS_ACTIVE" == "active" ]]; then
        print "$ColorReset➜ [$Bold$Blue $1$ColorReset$Normal $Green✓$ColorReset$Dim active "

        case "$IS_UP" in
            running) print "$Green▲$ColorReset$Dim up$Normal$ColorReset ]" ;;
            dead)    print "$Red▼$ColorReset$Dim down$ColorReset ]" ;;
            *)       print "$IS_UP ]" ;;
        esac

    elif [[ "$IS_ACTIVE" == "inactive" ]]; then
        print "$ColorReset➜ [$Bold$Blue $1$ColorReset$Normal $Red✗$ColorReset inactive ]"

    else
        print "$ColorReset➜ [$Bold$Blue $1$ColorReset$Normal $Yellow●$ColorReset $IS_ACTIVE ] "
    fi
}
