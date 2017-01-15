# cron.gem

*This gem is deprecated. It used to be part of ProfileGem core but was extracted into a separate
gem as it's unnecessary and overly complex. It may be deleted in the future.*

This gem provides an extensible cron deployment utility, allowing you to define useful jobs
per-gem, then configure which jobs should be run per machine, and generate crontabs dynamically.

* `pgem_cron_info`: Outputs information about ProfileGem's cronjobs, particularly the `PATH` value
  it will use, and the list of available jobs you can enable.
* `PGEM_JOBS=...`: Set this in your `local.conf.sh` to a space-separated list of jobs ProfileGem is
  aware of to include these jobs in ProfileGem's generated crontab.
* `pgem_cron_out`: Prints the crontab to stdout for review.
* `pgem_cron_user`: Writes the ProfileGem cron jobs to the user's crontab, essentially
  `pgem_cron_out | crontab`.
* `pgem_cron_etc`: Writes the ProfileGem cron jobs to `/etc/cron.d/`, preserving the users crontab.

By default all jobs are disabled, however any jobs specified in `$CRON_GEM_JOBS` will be enabled for
the current machine. This allows gems to define complex or potentially conflicting jobs, and let
individual installations easily enable the jobs they need.

## Copyright and License

Copyright 2012-2016 Michael Diamond

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.