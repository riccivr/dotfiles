# mmcli
# Autogenerated from man page /usr/share/man/man8/mmcli.8.gz
# using Deroffing man parser
complete -c mmcli -s h -l help --description 'Show summary of options by group.'
complete -c mmcli -l help-all --description 'Show all groups and options.'
complete -c mmcli -l help-manager --description 'Show manager specific options.'
complete -c mmcli -l help-common --description 'Show common options.'
complete -c mmcli -l help-modem --description 'Show modem specific options.'
complete -c mmcli -l help-3gpp --description 'Show 3GPP specific options.'
complete -c mmcli -l help-cdma --description 'Show CDMA specific options.'
complete -c mmcli -l help-simple --description 'Show simple options.'
complete -c mmcli -l help-location --description 'Show location or positioning specific options.'
complete -c mmcli -l help-messaging --description 'Show messaging specific options.'
complete -c mmcli -l help-time --description 'Show time specific options.'
complete -c mmcli -l help-firmware --description 'Show firmware specific options.'
complete -c mmcli -l help-sim --description 'Show SIM card specific options.'
complete -c mmcli -l help-bearer --description 'Show bearer specific options.'
complete -c mmcli -l help-sms --description 'Show SMS specific options.'
complete -c mmcli -s G -l set-logging --description 'Set the logging level in ModemManager daemon.'
complete -c mmcli -s L -l list-modems --description 'List available modems.'
complete -c mmcli -s M -l monitor-modems --description 'List available modems and monitor modems added or removed.'
complete -c mmcli -s S -l scan-modems --description 'Scan for any potential new modems.'
complete -c mmcli -s m -l modem --description 'Specify a modem.'
complete -c mmcli -s b -l bearer --description 'Specify a bearer.'
complete -c mmcli -s i -l sim --description 'Specify a SIM card.'
complete -c mmcli -s s -l sms --description 'Specify an SMS.'
complete -c mmcli -s w -l monitor-state --description 'Monitor the state of a given modem.'
complete -c mmcli -s e -l enable --description 'Enable a given modem.'
complete -c mmcli -s d -l disable --description 'Disable a given modem.'
complete -c mmcli -s r -l reset --description 'Resets the modem to the settings it had when it… [See Man Page]'
complete -c mmcli -l factory-reset --description 'Resets the modem to its original factory default settings.'
complete -c mmcli -l command --description 'Send an AT COMMAND to the given modem.'
complete -c mmcli -l list-bearers --description 'List packet data bearers that are available for… [See Man Page]'
complete -c mmcli -l create-bearer --description 'Create a new packet data bearer for a given modem.'
complete -c mmcli -l delete-bearer --description 'Delete bearer from a given modem.'
complete -c mmcli -l set-allowed-modes --description 'Set allowed modes for a given modem.'
complete -c mmcli -l set-bands --description 'Set bands to be used for a given modem.'
complete -c mmcli -l set-preferred-mode --description 'Set the preferred MODE for the given modem.'
complete -c mmcli -l 3gpp-scan --description 'Scan for available 3GPP networks.'
complete -c mmcli -l 3gpp-register-home --description 'Request a given modem to register in its home network.'
complete -c mmcli -l 3gpp-register-in-operator --description 'Request a given modem to register on the networ… [See Man Page]'
complete -c mmcli -l 3gpp-ussd-status --description 'Request the status of ANY ongoing USSD session.'
complete -c mmcli -l 3gpp-ussd-initiate --description 'Request the given modem to initiate a USSD sess… [See Man Page]'
complete -c mmcli -l 3gpp-ussd-respond --description 'When initiating an USSD session, a RESPONSE may… [See Man Page]'
complete -c mmcli -l 3gpp-ussd-cancel --description 'Cancel an ongoing USSD session for a given modem.'
complete -c mmcli -l cdma-activate --description 'Activate the given modem using OTA (Over the Air) settings.'
complete -c mmcli -l simple-connect --description 'Run a full connection sequence using KEY / VALUE pairs.'
complete -c mmcli -l simple-disconnect --description 'Disconnect ALL connected bearers for a given modem.'
complete -c mmcli -l simple-status --description 'Display the status of the given modem.'
complete -c mmcli -l location-status --description 'Show the current status for discovering our location.'
complete -c mmcli -l location-get --description 'Show all location information available.'
complete -c mmcli -l location-enable-3gpp --description 'Enable location discovery using the 3GPP network.'
complete -c mmcli -l location-disable-3gpp --description 'Disable location discovery using the 3GPP network.'
complete -c mmcli -l location-get-3gpp --description 'Show 3GPP based location information (MCC, MNC, LAC, CI).'
complete -c mmcli -l location-enable-gps-nmea --description 'Enable location discovery using GPS and reporte… [See Man Page]'
complete -c mmcli -l location-disable-gps-nmea --description 'Disable location discovery using GPS and NMEA traces.'
complete -c mmcli -l location-get-gps-nmea --description 'Show GPS based location with NMEA trace information.'
complete -c mmcli -l location-enable-gps-raw --description 'Enable location discovery using GPS and reported with raw (i.'
complete -c mmcli -l location-disable-gps-raw --description 'Disable location discovery using GPS and raw values.'
complete -c mmcli -l location-get-gps-raw --description 'Show GPS based location information with raw values (e. g.'
complete -c mmcli -l location-enable-cdma-bs --description 'Enable location discovery using the 3GPP2 network.'
complete -c mmcli -l location-disable-cdma-bs --description 'Disable location discovery using the 3GPP2 network.'
complete -c mmcli -l location-get-cdma-bs --description 'Show 3GPP2 based location information (location… [See Man Page]'
complete -c mmcli -l messaging-status --description 'Show the status of the messaging support.'
complete -c mmcli -l messaging-list-sms --description 'List SMS messages available on a given modem.'
complete -c mmcli -l messaging-create-sms --description 'Create a new SMS on a given modem.'
complete -c mmcli -l messaging-create-sms-with-data --description 'Use PATH to a filename as the data to create a new SMS.'
complete -c mmcli -l messaging-delete-sms --description 'Delete an SMS from a given modem.  PATH indicates the SMS path.'
complete -c mmcli -l time --description 'Display the current network time from the operator.'
complete -c mmcli -l firmware-list --description 'List all the firmware images installed on a given modem.'
complete -c mmcli -l firmware-select --description 'Select a firmware image from those installed on a given modem.'
complete -c mmcli -l pin --description 'Send PIN code to a given SIM card.'
complete -c mmcli -l puk --description 'Send PUK code to a given SIM card.  This must be used WITH.'
complete -c mmcli -l 'pin.' --description '.'
complete -c mmcli -l enable-pin --description 'Enable PIN request for a given SIM card.'
complete -c mmcli -l disable-pin --description 'Disable PIN request for a given SIM card.'
complete -c mmcli -l change-pin --description 'Change the PIN for a given SIM card.  It will be set to PIN.'
complete -c mmcli -s c -l connect --description 'Connect to a given bearer.'
complete -c mmcli -s x -l disconnect --description 'Disconnect from a given bearer.'
complete -c mmcli -l send --description 'Send an SMS.'
complete -c mmcli -l store --description 'This option will store the SMS in the default s… [See Man Page]'
complete -c mmcli -l store-in-storage --description 'This option states which STORAGE to use for SMS messages.'
complete -c mmcli -l create-file-with-data --description 'This option takes an SMS that has DATA (not TEX… [See Man Page]'
complete -c mmcli -s v -l verbose --description 'Perform actions with more details reported and/or logged.'
complete -c mmcli -s V -l version --description 'Returns the version of this program.'
complete -c mmcli -s a -l async --description 'Use asynchronous methods.'
complete -c mmcli -l timeout --description 'Use SECONDS for the timeout when performing ope… [See Man Page]'
complete -c mmcli -l '3gpp-scan.' --description '.'
complete -c mmcli -l 'location-get-gps-raw;' --description '    $ sudo mmcli -m 0 --location-get     /org/f… [See Man Page]'

