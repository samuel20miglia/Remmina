# Remmina - The GTK+ Remote Desktop Client
#
# Copyright (C) 2016 Denis Ollier
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA  02110-1301, USA.
#
#  In addition, as a special exception, the copyright holders give
#  permission to link the code of portions of this program with the
#  OpenSSL library under certain conditions as described in each
#  individual source file, and distribute linked combinations
#  including the two.
#  You must obey the GNU General Public License in all respects
#  for all of the code used other than OpenSSL. *  If you modify
#  file(s) with this exception, you may extend this exception to your
#  version of the file(s), but you are not obligated to do so. *  If you
#  do not wish to do so, delete this exception statement from your
#  version. *  If you delete this exception statement from all source
#  files in the program, then also delete it here.

include(FindPkgConfig)

if(PKG_CONFIG_FOUND)
	pkg_check_modules(PC_SPICE_PROTOCOL spice-protocol)

	if(GTK3_FOUND)
		pkg_check_modules(PC_SPICE_CLIENT spice-client-gtk-3.0)
	else()
		pkg_check_modules(PC_SPICE_CLIENT spice-client-gtk-2.0)
	endif()
endif()

if(PC_SPICE_CLIENT_FOUND)
	set(SPICE_LIBRARIES ${PC_SPICE_CLIENT_LIBRARIES})
	set(SPICE_INCLUDE_DIRS ${PC_SPICE_CLIENT_INCLUDE_DIRS})

	set(SPICE_FOUND TRUE)
endif()
