# Home Assistant Community Add-on: Ser2net

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

Ser2net is a proxy that allows TCP/IP connections to be made to serial ports on a machine.

## About

Ser2net provides a way for applications to communicate with serial devices over a network. It listens for incoming TCP connections and forwards the data to a specified serial port, and vice versa.

This add-on allows you to easily run ser2net within Home Assistant, configured via YAML.

## Installation

The installation of this add-on is pretty straightforward and not different in comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Configure the `connections` options.
1. Start the "Ser2net" add-on.
1. Check the logs of the "Ser2net" add-on to see if everything went well.

## Configuration

The add-on can be used with the basic configuration, with other options for more advanced users.

**Note**: _Remember to restart the add-on when the configuration is changed._

Ser2net add-on configuration:

```yaml
log_level: info
connections:
  - name: mydevice
    port: 2000
    device: /dev/ttyUSB0
    baud: 9600
    parity: none
    stopbits: 1
    databits: 8
    max_connections: 5
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the add-on and can be changed to be more or less verbose, which might be useful when you are dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `notice`: Normal but significant events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `critical`: Critical conditions.
- `alert`: Action must be taken immediately.
- `emergency`: System is unusable.

Please note that each level automatically includes log messages from a more severe level, e.g., `debug` also shows `info` messages. By default, the `log_level` is set to `info`, which is the recommended setting unless you are troubleshooting.

### Option: `connections`

This option allows you to specify a list of serial connections to proxy.

#### Sub-option: `name`

The name of the connection.

#### Sub-option: `port`

The TCP port to listen on.

#### Sub-option: `device`

The serial device path (e.g., /dev/ttyUSB0).

#### Sub-option: `baud`

The baud rate for the serial connection.

#### Sub-option: `parity`

The parity setting: `none`, `even`, or `odd`.

#### Sub-option: `stopbits`

The number of stop bits: `1` or `2`.

#### Sub-option: `databits`

The number of data bits: `5`, `6`, `7`, or `8`.

#### Sub-option: `max_connections` (optional)

The maximum number of simultaneous connections allowed for this serial device. Valid range: 1-100. If not specified, connections are unlimited.

#### Sub-option: `kickolduser` (optional)

Whether to kick the old user when a new connection is made.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [cfouche3005][cfouche3005].

For a full list of all authors and contributors, check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2025 cfouche3005

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=ser2net&repository_url=https%3A%2F%2Fgithub.com%2Fcfouche3005%2Faddon-ser2net
[contributors]: https://github.com/cfouche3005/addon-ser2net/graphs/contributors
[cfouche3005]: https://github.com/cfouche3005
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ser2net/XXXXX
[issue]: https://github.com/cfouche3005/addon-ser2net/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[reddit]: https://reddit.com/r/homeassistant
[release-shield]: https://img.shields.io/badge/version-1.0.0-blue.svg
[release]: https://github.com/cfouche3005/addon-ser2net/tree/1.0.0