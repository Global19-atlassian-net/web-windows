<?xml version="1.0" encoding="UTF-8"?>
<!-- !!! This file is generated. Explore one of the following for changes
	- include/listing.php
	- templates/web.config.tpl
	- templates/web.config.redirect.tpl
 -->
<configuration>
    <system.webServer>
        <rewrite>
            <rules>
                <clear />
				<!--  redirect all traffic from http to https -->
                <rule name="Redirect to https" enabled="true" stopProcessing="true">
                    <match url=".*" />
                    <conditions>
                        <add input="{HTTPS}" pattern="off" ignoreCase="true" />
                    </conditions>
                    <action type="Redirect" url="https://{HTTP_HOST}{REQUEST_URI}" redirectType="Permanent" appendQueryString="false" />
                </rule>
				<!--  redirect traffic from empty user agents to prevent bandwidth flooding -->
                <rule name="Rewrite Empty User-Agent" stopProcessing="true">
                    <match url="^downloads/.*$" />
                    <conditions>
                        <add input="{HTTP_USER_AGENT}" pattern="^$" />
                    </conditions>
                    <action type="Rewrite" url="/user-agent.txt" />
                </rule>
				<!--  redirects for windows.php.net main site -->
                <rule name="Rewrite /download/" stopProcessing="true">
                    <match url="^download/?$" />
                    <action type="Rewrite" url="/listing.php?mode=release" appendQueryString="false" />
                </rule>
                <rule name="Rewrite /qa/" stopProcessing="true">
                    <match url="^qa/?$" />
                    <action type="Rewrite" url="/listing.php?mode=qa" appendQueryString="false" />
                </rule>
                <rule name="Rewrite /snaps/" stopProcessing="true">
                    <match url="^snaps/?$" />
                    <action type="Rewrite" url="/listing.php?mode=snaps" appendQueryString="false" />
                </rule>
                <rule name="Rewrite /snapshots/" stopProcessing="true">
                    <match url="^snapshots/?$" />
                    <action type="Rewrite" url="/snapshot.html" appendQueryString="false" />
                </rule>
                <rule name="Rewrite /team/" stopProcessing="true">
                    <match url="^team/?$" />
                    <action type="Rewrite" url="/team.php" appendQueryString="false" />
                </rule>

		<!-- Autogenerated part start  -->
		RELEASES_REDIRECT_TO_LATEST_PLACEHOLDER
		<!-- Autogenerated part end  -->
            </rules>
        </rewrite>
    </system.webServer>
</configuration>