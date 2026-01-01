# hubitat-honeywell
An app and driver for the Honeywell Home thermostats (Lyric, T5, T6, T9, T10+, etc.). This uses the official Honeywell Home APIs and services.

## Supported Devices
- **Thermostats**: Lyric (LCC series), T5, T6, T9, T10+ PRO (TCC series)
- **Remote Sensors**: T9 and T10+ PRO room sensors are fully supported

## Notes
This is production-ready code that has been tested with various Honeywell thermostat models. The T10+ PRO thermostat with room sensors is fully supported through the same API structure as the T9. Feel free to submit pull requests for improvements; on major improvements, a new release will be tagged.

## Install
- Import the driver and the app (or use Hubitat Package Manager)
- Create a new instance of the app
- Authenticate with Honeywell (establish OAuth Link)
- Discover devices

## Features
- **Temperature Control**: Set heating and cooling setpoints
- **Mode Control**: Heat, Cool, Auto, Off modes
- **Fan Control**: Auto, On, Circulate modes
- **Remote Sensors**: Automatic discovery and monitoring of T9/T10+ room sensors
- **Schedule Hold**: Support for NoHold, TemporaryHold, PermanentHold states (LCC devices)
- **Auto Refresh**: Configurable polling intervals (1-55 minutes or disabled)
- **Temperature Units**: Both Fahrenheit and Celsius support (Celsius implemented but requires testing)

### Not Yet Implemented
- **Events**: Honeywell supports Azure Event Grid for real-time updates, but this requires additional infrastructure and may need per-user accounts
- **Schedules via Honeywell**: Schedule management through the Honeywell API is not implemented (consider using the Hubitat Thermostat Scheduler instead)
- **Name Changes**: If you rename a device in the Honeywell app, you'll need to rediscover devices in Hubitat
- **TemporaryHold with nextPeriodTime**: The nextPeriodTime parameter for TemporaryHold is not yet implemented (see TODO in code)

### Known Limitations
- **Token Refresh**: Tokens may require forced refresh from time to time. There is a scheduled refresh and a force refresh option in the debug menu
- **Celsius**: Temperature conversion to Celsius is implemented for sensors and thermostats, but has not been thoroughly tested. Please report any issues

## Troubleshooting
- If devices aren't discovered, try the "Force Token Refresh" button in the debug menu
- If remote sensors aren't showing up, ensure they are properly configured in the Honeywell Home app first
- Check the logs with "Enable Debug Logging" for detailed troubleshooting information

## Credits
- Considerable inspiration and examples from @dkilgore90 (https://github.com/dkilgore90/google-sdm-api/blob/develop/sdm-api-app.groovy)
- Credit to Tim Yuhl in the Hubitat community for patiently testing and improving this over days/weeks
- Credit to the community contributors for ongoing improvements and bug fixes
