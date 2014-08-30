<?php function print_element_tree($e, $l, $t) { ?>
	<div style="margin-left: <?= $l * 30 ?>; width: 600px; border-style: solid; border-width: 1px;">
		<div style="float: left; width: 400px">
			<div>
				<div>
					<div style="float: left; width: 100px">Element ID:</div>
					<input name="" type=text value="<?= $e["id_elements"] ?>" style="float: right; width: 280px" /><br style="clear: both" />
				</div>
				<div>
					<div style="float: left; width: 100px">Element type:</div>
					<select name="element_type" size="1" style="float: right; width: 280px">
						<?php foreach ($t as $key => $val) { ?>
							<option value="<?= $val["id_element_types"] ?>" <?= ($e["fk_id_element_types"]["id_element_types"] == $val["id_element_types"]) ? "selected" : "" ?>><?= $val["description"] ?></option>
						<?php } ?>
					</select>
				</div>
				<div style="float: left; width: 180">
					<div style="float: left; width: 100px">Ordinal Nr.:</div>
					<input name="" type=text value="<?= $e["ordinal"] ?>" style="float: right; width: 60px" /><br style="clear: both" />
				</div>
				<div style="float: right; width: 180">
					<div style="float: left; width: 100px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Position:</div>
					<input name="" type=text value="<?= $e["position"] ?>" style="float: right; width: 60px" /><br style="clear: both" />
				</div>
				<div>
					<div style="float: left; width: 100px">Description:</div>
					<input name="" type=text value="<?= $e["description"] ?>" style="float: right; width: 280px" />
				</div>
			</div>
		</div>
		<div style="float: right; margin: 1px; width: 160px">
			<button onclick="">Save</button>
			<button onclick="">Delete</button>
			<button onclick="">New</button>
			<button onclick="window.open('/backend/elemdataeditor?id=<?= $e["id_elements"] ?>')">Edit data</button>
			<?php if (count($e["subelements"]) > 0) { ?>
				<button onclick="$('#<?= $e["id_elements"] ?>').val(1) ; $('#subelems_<?= $e["id_elements"] ?>').show(); save_display()">Show subelements</button>
				<button onclick="$('#<?= $e["id_elements"] ?>').val(0) ; $('#subelems_<?= $e["id_elements"] ?>').hide(); save_display()">Hide subelements</button>
			<?php } ?>
		</div>
		<div style="clear: both"></div>
	</div>
	<div id="subelems_<?= $e["id_elements"] ?>" style="display: none">
		<input type=hidden id="<?= $e["id_elements"] ?>" class="subelem_display" value="0">
		<?php foreach ($e["subelements"] as $key => $val) { print_element_tree($val, $l + 1, $t); } ?>
	</div>
<?php } ?>
<?php print_element_tree($this->get_value("etree"), 0, $this->get_value("etypes")); ?>
<script type="text/javascript">

function save_display(cb) {
	var state = [];
	$(".subelem_display").each(function() {
		state[$(this).attr("id")] = parseInt($(this).attr("value"));
	});
	var data = JSON.stringify(state);
	new $ajax().ok(function(result) {
		console.log(result);
		if (typeof(cb) == "function") {
			cb(result);
		}
	}).data("&data=" + escape(data)).post("/backend/elementstree/viewstate");
}

function restore_display() {
	new $ajax().ok(function(result) {
		result = JSON.parse(result);
		console.log(result);
		if (result) {
			$(".subelem_display").each(function() {
				$(this).val((result[parseInt($(this).attr("id"))] == 1) ? 1 : 0);
				if ((result[parseInt($(this).attr("id"))] == 0) || (result[$(this).attr("id")] == null)) {
					$('#subelems_' + parseInt($(this).attr("id"))).hide();
				} else if (parseInt(result[$(this).attr("id")]) == 1) {
					$('#subelems_' + parseInt($(this).attr("id"))).show();
				}
			});
		}
	}).get("/backend/elementstree/viewstate");
}

restore_display();

</script>
