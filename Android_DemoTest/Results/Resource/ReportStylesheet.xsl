<html xsl:version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ms="urn:schemas-microsoft-com:xslt" xmlns:dt="urn:schemas-microsoft-com:datatypes"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:DateFormat="java.text.SimpleDateFormat">

	<head>
		<meta charset='UTF-8'>
			<title>Test Automation Results Dashboard</title>
			<link rel="stylesheet" href="..\Resource\table.css" type="text/css" />
			<link rel="stylesheet" href="..\Resource\amchart.css" type="text/css" />
			<script src="..\Resource\amcharts.js" type="text/javascript" />
			<script src="..\Resource\pie.js" type="text/javascript" />
			<script type='text/javascript' src='..\Resource\Report.js' />
			<script type="text/javascript" src="..\Resource\gauge.js"></script>
			<script>
				<![CDATA[
					var gauge = AmCharts.makeChart("gauagediv", {
						type : "gauge",
						titles : [ {
							"text" : "",
							"size" : 15
						} ],
						color : "#FFFFFF",
						axes : [ {
							startValue : 0,
							axisThickness : 1,
							endValue : 100,
							valueInterval : 10,
							bottomTextYOffset : -20,
							bottomText : "0 %",
					
							bands : [ {
								startValue : 0,
								endValue : 70,
								color : "#ea3838"
							}, {
								startValue : 70,
								endValue : 95,
								color : "#ffac29"
							}, {
								startValue : 95,
								endValue : 100,
								color : "#00CC00",
								innerRadius : "95%"
							} ]
						} ],
						arrows : [ {} ]
					});
					
					setInterval(randomValue, 500);

					function randomValue() {
						var value = Math.round(Math.random() * 200);
						gauge.arrows[0].setValue(
				]]>
					<xsl:value-of select="floor((count(test_suite/testcases/testcase) * 100) div (count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])=0])))" />
				<![CDATA[);
					gauge.axes[0].setBottomText(
				]]>
					<xsl:value-of select="floor((count(test_suite/testcases/testcase) * 100) div (count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])=0])))" />
				<![CDATA[
				 	+ " %");
					}
					var chart;
					var legend;
					var chartData = 
					[{'Status': 'Pass',
					'value': 
				]]>
				<xsl:value-of select="count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])=0])" />
				<![CDATA[
					},
					{
					'Status': 'Fail',
					'value': ]]>
				<xsl:value-of select="count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])>0])" />
				
				<![CDATA[}
					];
					AmCharts.ready(function () {
						// PIE CHART
						chart = new AmCharts.AmPieChart();
						chart.dataProvider = chartData;
						chart.colors = ["#008000", "#B0171F", "#FFFF00"];
						chart.color="#FFFFFF";
						chart.titleField = "Status";
						chart.valueField = "value";
						/*  chart.outlineColor = "#FFFFFF";
						chart.outlineAlpha = 0.8;
						chart.outlineThickness = 2; */
						chart.sequencedAnimation = false;
						chart.startEffect = "elastic";
						chart.innerRadius = "0%";
						chart.startDuration = 0;
						chart.labelRadius = 15;
						chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
						// this makes the chart 3D
						chart.depth3D = 15;
						chart.angle = 30;
						// WRITE
						chart.write("chartdiv");
					});
				]]>
			</script>
		</meta>
	</head>
	<body>
		<br />
		<table id='Logos' class='logo'>
			<thead>
				<tr class='content'>
					<th class='logo' style='border-top:0px;border-bottom:0px'>
						<img align='left' src='../Resource/Images/enhops-logo.png' />
					</th>
					<th class='logo'
						style='text-align: left;font-family: Calibri;font-size:30px;border: 0px;vertical-align: middle; '> Test Automation Result Dashboard </th>
				</tr>
			</thead>
		</table>
		<br />
		<table id='header'>
			<colgroup>
				<col style="width:25%"/>
				<col style="width:25%"/>
				<col style="width:25%"/>
				<col style="width:25%"/>
			</colgroup>
			<thead>
				<tr class='heading'>
					<th class='round' colspan='4'> Automation Execution Result Summary </th>
				</tr>
				<tr class='subheading'>
					<td class='roundleft'> Date Time </td>
					<td class='roundright'>
						<xsl:value-of select="test_suite/start_time" />
					</td>
					<td class='roundleft'>Suite Name</td>
					<td class='roundright'>
						<xsl:value-of select="test_suite/id" />
					</td>
				</tr>
				<tr class='content'>
					<td class='roundleft'>Tests Passed:</td>
					<td class='roundright'>
						<xsl:value-of
							select="count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])=0])" />
					</td>
					<td class='roundleft'>Tests Failed:</td>
					<td class='roundright'>
						<xsl:value-of
							select="count(test_suite/testcases/testcase[count(test_steps/test_step[status='fail'])>0])" />
					</td>
				</tr>
				<tr>
					<th style='border-top:0px;border-bottom:0px' colspan='2'>
						<br />
						Test Results By Status
						<br />
						<div id="chartdiv" style="width: 100%; height: 200px;margin-top: 0px;"></div>
					</th>
					<th style='border-top:0px;border-bottom:0px' colspan='2'>
						<br />
						Pass percentage
						<br />
						<div id="gauagediv" style="width: 100%; height: 200px;margin-top: 0px;"></div>
					</th>
				</tr>
			</thead>
		</table>
		<br />

		<table id='main'>
			<colgroup>
				<col style='width: 5%' />
				<col style='width: 18%' />
				<col style='width: 36%' />
				<col style='width: 20%' />
				<col style='width: 20%' />
				<col style='width: 10%' />
			</colgroup>
			<thead>
				<tr class='heading'>
					<th class='roundleft'>S.NO</th>
					<th>User Story</th>
					<th>Description</th>
					<th>Start Time</th>
					<th>End Time</th>
					<th class='roundright'>Status</th>
				</tr>
			</thead>
			<xsl:for-each select="test_suite/testcases/testcase">
				<tbody>
					<tr class='content2' onclick="toggleTableRow('{position()}')">
						<td class='roundleft'>
							<xsl:value-of select="position()" />
						</td>
						<td class='justified'>
							<div class="tooltip">
								<span>
									Total steps:
									<xsl:value-of select="count(test_steps/test_step)" />
									<br />
									Pass steps:
									<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
									<br />
									Fail steps:
									<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
								</span>
								<xsl:value-of select="@id" />
							</div>

						</td>
						<td class='justified'>
							<div class="tooltip">
								<span>
									Total steps:
									<xsl:value-of select="count(test_steps/test_step)" />
									<br />
									Pass steps:
									<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
									<br />
									Fail steps:
									<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
								</span>
								<xsl:value-of select="description" />
							</div>
						</td>
						<td class='justified'>
							<div class="tooltip">
								<span>
									Total steps:
									<xsl:value-of select="count(test_steps/test_step)" />
									<br />
									Pass steps:
									<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
									<br />
									Fail steps:
									<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
								</span>
								<xsl:value-of select="start_time" />
							</div>
						</td>
						<td class='justified'>
							<div class="tooltip">
								<span>
									Total steps:
									<xsl:value-of select="count(test_steps/test_step)" />
									<br />
									Pass steps:
									<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
									<br />
									Fail steps:
									<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
								</span>
								<xsl:value-of select="end_time" />
							</div>
						</td>
						<xsl:if test="count(test_steps/test_step[status='fail'])>0">
							<td class='roundright'>
								<div class="tooltip">
									<span>
										Total steps:
										<xsl:value-of select="count(test_steps/test_step)" />
										<br />
										Pass steps:
										<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
										<br />
										Fail steps:
										<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
									</span>
									fail
								</div>
							</td>
						</xsl:if>
						<xsl:if test="count(test_steps/test_step[status='fail'])=0">
							<td class='roundright'>
								<div class="tooltip">
									<span>
										Total steps:
										<xsl:value-of select="count(test_steps/test_step)" />
										<br />
										Pass steps:
										<xsl:value-of select="count(test_steps/test_step[status='Pass'])" />
										<br />
										Fail steps:
										<xsl:value-of select="count(test_steps/test_step[status='fail'])" />
									</span>
									pass
								</div>
							</td>
						</xsl:if>
					</tr>
					<tr id="{position()}" style='background-color: #0169B2; display: none;'>
						<td style='background-color: #0169B2;' colspan='6'>
							<table>
							<colgroup>
								<col style="width:11%"/>
								<col style="width:12%"/>
								<col style="width:28%"/>
								<col style="width:11%"/>
								<col style="width:10%"/>
								<col style="width:28%"/>
							</colgroup>
								<thead>
									<tr class='heading'>
										<th class='roundleft'>Step No</th>
										<th>Step Type</th>
										<th>Description</th>
										<th>Result</th>
										<th>Status</th>
										<th class='roundright'>Time Stamp</th>
									</tr>
								</thead>

								<xsl:for-each select="test_steps/test_step">
									<tr class='content2'>
										<td class='roundleft'>
											<xsl:value-of select="position()" />
										</td>
										<td class='justified'>
											<xsl:value-of select="@id" />
										</td>
										<td class='justified'>
											<xsl:value-of select="description" />
										</td>
										<td class='justified'>
											<xsl:value-of select="actual_result" />
										</td>
										<td class='justified'>
											<xsl:if test="screenshot_path != ''">
												<xsl:variable name="SShot" select="screenshot_path" />
												<a href='{$SShot}'>
													<xsl:value-of select="status" />
												</a>
											</xsl:if>
											<xsl:if test="screenshot_path = ''">
												<xsl:value-of select="status" />
											</xsl:if>
										</td>
										<td class='roundright'>
											<xsl:value-of select="time_stamp" />
										</td>
									</tr>
								</xsl:for-each>

							</table>
						</td>
					</tr>
				</tbody>
			</xsl:for-each>

		</table>
		<br />
		<table id='footer'>
			<colgroup>
				<col style='width: 25%' />
				<col style='width: 25%' />
				<col style='width: 25%' />
				<col style='width: 25%' />
			</colgroup>
			<tfoot>
				<tr class='heading'>
					<th style='border-top:0px;border-bottom:0px' colspan='4'>
						Total Duration In Seconds (Including Report Creation) :
						<xsl:value-of select="test_suite/duration" />
					</th>
				</tr>
			</tfoot>
		</table>
	</body>
</html>