<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />
	<!-- Import include files -->
	<xsl:include href="includes/head.xsl"/>
	<xsl:include href="includes/header.xsl"/>
	<xsl:include href="includes/footer.xsl"/>

	<xsl:include href="includes/mountnav.xsl"/>

	<xsl:template match="/icestats">
		<html>

			<xsl:call-template name="head">
				<xsl:with-param name="title">Stats</xsl:with-param>
			</xsl:call-template>

			<body>
				<!-- Header/Menu -->
				<xsl:call-template name="header" />

				<div class="section">
					<h2>Update Metadata</h2>

					<xsl:for-each select="source">
						<div class="article">
							<h3>Mountpoint  <xsl:value-of select="@mount" /></h3>
							<!-- Mount nav -->
							<xsl:call-template name="mountnav" />
							<form method="get" action="/admin/metadata.xsl">
								<label for="metadata" class="hidden">Metadata</label>
								<input type="text" id="metadata" name="song" value="" placeholder="Click to edit" required="required" />
								<input type="hidden" name="mount" value="{@mount}" />
								<input type="hidden" name="mode" value="updinfo" />
								<input type="hidden" name="charset" value="UTF-8" />
								<input type="submit" value="Update Metadata" />
							</form>
						</div>
					</xsl:for-each>

				</div>

				<!-- Footer -->
				<xsl:call-template name="footer" />

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>