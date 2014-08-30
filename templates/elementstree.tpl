<?php function print_element_tree($e, $l) { ?>
	<div style="margin-left: <?= $l * 30 ?>; width: 600px; border-style: solid; border-width: 1px;">
		<div style="float: left; width: 400px">
			<p>
				Element ID:
				<input name="" type=text value="<?= $e["id_elements"] ?>" style="float: right; width: 280px" /><br style="clear: both" />
				Element type:
				<input name="" type=text value="<?= $e["fk_id_element_types"]["description"] ?>" style="float: right; width: 280px" /><br style="clear: both" />
				Ordinal Nr.:
				<input name="" type=text value="<?= $e["ordinal"] ?>" style="float: right; width: 280px" /><br style="clear: both" />
				Position:
				<input name="" type=text value="<?= $e["position"] ?>" style="float: right; width: 280px" /><br style="clear: both" />
				Description:
				<input name="" type=text value="<?= $e["description"] ?>" style="float: right; width: 280px" />
			</p>
		</div>
		<div style="float: right; margin: 16px; width: 160px">
			<?php if (count($e["subelements"]) > 0) { ?>
				<button onclick="$('#<?= $e["id_elements"] ?>').val(1) ; $('#subelems_<?= $e["id_elements"] ?>').show()">Show subelements</button>
				<button onclick="$('#<?= $e["id_elements"] ?>').val(0) ; $('#subelems_<?= $e["id_elements"] ?>').hide()">Hide subelements</button>
			<?php } ?>
			<button>Save</button>
			<button>Delete</button>
			<button>New</button>
			<button onclick="window.open('/backend/elemdataeditor?id=<?= $e["id_elements"] ?>')">Edit data</button>
		</div>
		<div style="clear: both"></div>
	</div>
	<div id="subelems_<?= $e["id_elements"] ?>" style="display: none">
		<input type=hidden id="<?= $e["id_elements"] ?>" class="subelem_display" value="0">
		<?php foreach ($e["subelements"] as $key => $val) { print_element_tree($val, $l + 1); } ?>
	</div>
<?php } ?>
<?php print_element_tree($this->get_value("etree"), 0); ?>
<script type="text/javascript">

function save_display(cb) {
	var state = [];
	$(".subelem_display").each(function() {
		state[$(this).attr("id")] = parseInt($(this).attr("value"));
	});
	var data = JSON.stringify(state);
	new $ajax().ok(function(result) {
		console.log(result);
		cb(result);
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
