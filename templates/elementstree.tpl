<div style="background-color: #FEDDCC">
	<button onclick="generate_seo_links()" style="margin: 20px">Generate SEO links</button>
	<button onclick="expand_all()" style="margin: 20px">Expand all</button>
	<button onclick="collapse_all()" style="margin: 20px">Collapse all</button>
</div>
<div style="background-color: #FFFFEC">
	<?php function print_element_tree($e, $l, $t, $i) { 
		$color = ($e["fk_id_parent_element"] != null) ? "#CCFFDD" : "#FFCCDD" ;?>
		<div style="width: 600px; border-style: solid; border-width: 1px; <?= ($e["fk_id_element_types"]["is_page"] == "1") ? "background-color: ".$color : "" ?>">
			<form id="pgtreeform_<?= $e["id_elements"] ?>" name="pgtreeform_<?= $e["id_elements"] ?>" action="/backend/elementstree/save" method="post">
				<div style="float: left; width: 410px">
					<div>
						<div>
							<div style="float: left; width: 130px">Element ID:</div>
							<input name="id_elements" type=text value="<?= $e["id_elements"] ?>" disabled="disabled" style="float: left; width: 60px" />
							<button onclick="copy_subtree(<?= $e["id_elements"] ?>);" style="margin-left: 30px">Copy to parent:</button>
							<input id="new_fk_id_parent_element_<?= $e["id_elements"] ?>" name="new_fk_id_parent_element" type=text value="" style="float: right; width: 60px" />
							<br style="clear: both" />
						</div>
						<div>
							<div style="float: left; width: 100px">Element type:</div>
							<select name="fk_id_element_types" size="1" style="float: right; width: 280px">
								<?php foreach ($t as $key => $val) { ?>
									<option value="<?= $val["id_element_types"] ?>" <?= ($e["fk_id_element_types"]["id_element_types"] == $val["id_element_types"]) ? "selected" : "" ?>>
										<?= $val["is_page"] ? "Page: " : "Elem: " ?> <?= $val["description"] ?>
									</option>
								<?php } ?>
							</select>
						</div>
						<div style="float: left; width: 190">
							<div style="float: left; width: 100px">Ordinal Nr.:</div>
							<input name="ordinal" type=text value="<?= $e["ordinal"] ?>" style="float: right; width: 60px" /><br style="clear: both" />
						</div>
						<div style="float: right; width: 180">
							<div style="float: left; width: 100px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Position:</div>
							<input name="position" type=text value="<?= $e["position"] ?>" style="float: right; width: 60px" /><br style="clear: both" />
						</div>
						<div>
							<div style="float: left; width: 100px">Description:</div>
							<input name="description" type=text value="<?= strtolower(str_replace(" ", "_", $e["description"])) ?>" style="float: right; width: 470px; margin-right: -190px" />
						</div>
					</div>
				</div>
				<div style="float: right; margin: 1px; width: 160px">
					<input id="submitbtn" type="button" onclick="save_display(function(){document.forms['pgtreeform_<?= $e["id_elements"] ?>'].submit();})" value="Save" />
					<button onclick="delete_element(<?= $e["id_elements"] ?>); return false;">Delete</button>
					<button onclick="return false;">+</button>
					<button onclick="window.open('/backend/addelement?id=<?= $e["id_elements"] ?>'); return false;">New</button>
					<button onclick="window.open('/backend/elemdataeditor?id=<?= $e["id_elements"] ?>'); return false;">Edit data</button>
					<?php if (count($e["subelements"]) > 0) { ?>
						<button id="subelems_btn_<?= $e["id_elements"] ?>" 
							onclick="$('#<?= $e["id_elements"] ?>').val(0); 
										$('#subelems_<?= $e["id_elements"] ?>').hide(500); 
										$('#subelems_plh_<?= $e["id_elements"] ?>').show(500); 
										$('#subelems_btn_<?= $e["id_elements"] ?>').hide(500); 
										save_display(); 
										return false;" 
							style="display: none">
								Hide subelements
						</button>
					<?php } ?>
				</div>
				<div style="clear: both"></div>
				<input type="hidden" name="id" value="<?= $i ?>">
				<input type="hidden" name="id_elements" value="<?= $e["id_elements"] ?>">
				<input type="hidden" name="fk_id_parent_element" value="<?= $e["fk_id_parent_element"] ?>">
			</form>
		</div>
		<?php if (count($e["subelements"]) > 0) { ?>
			<div id="subelems_<?= $e["id_elements"] ?>" style="margin-left: 30px; display: none; border-style: dotted; border-width: 1px; border-color: red">
				<input type="hidden" id="<?= $e["id_elements"] ?>" class="subelem_display" value="0">
				<?php foreach ($e["subelements"] as $key => $val) { if (isset($val["id_elements"])) print_element_tree($val, $l + 1, $t, $i); } ?>
			</div>
			<div id="subelems_plh_<?= $e["id_elements"] ?>" style="margin-left: 30px; display: block; border-style: dotted; border-width: 1px; border-color: red"
				onclick="$('#<?= $e["id_elements"] ?>').val(1) ; $('#subelems_<?= $e["id_elements"] ?>').show(500); $('#subelems_plh_<?= $e["id_elements"] ?>').hide(500); $('#subelems_btn_<?= $e["id_elements"] ?>').show(500); save_display(); return false;">
				<div style="width: 600px; border-style: solid; border-width: 1px; border-color: black; background-color: #EEEEEE">
					&nbsp;+
				</div>
			</div>
		<?php } ?>
		<?php } ?>
	<?php print_element_tree($this->get_value("etree"), 0, $this->get_value("etypes"), $this->get_value("id")); ?>
</div>
<script type="text/javascript">

function save_display(cb) {
	var state = [];
	$(".subelem_display").each(function() {
		state[$(this).attr("id")] = parseInt($(this).attr("value"));
	});
	state[0] = getScrollXY();
	var data = JSON.stringify(state);
	new $ajax().ok(function(result) {
		console.log(result);
		if (typeof(cb) == "function") {
			cb(result);
		}
	}).data("&data=" + escape(data)).post("/backend/elementstree/viewstate");
	return false;
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
					$('#subelems_plh_' + parseInt($(this).attr("id"))).show();
					$('#subelems_btn_' + parseInt($(this).attr("id"))).hide();
				} else if (parseInt(result[$(this).attr("id")]) == 1) {
					$('#subelems_' + parseInt($(this).attr("id"))).show();
					$('#subelems_plh_' + parseInt($(this).attr("id"))).hide();
					$('#subelems_btn_' + parseInt($(this).attr("id"))).show();
				}
			});
			setScrollXY(result[0]);
		}
	}).get("/backend/elementstree/viewstate");
	return false;
}

function delete_element(id) {
	if (confirm("Element " + id + " und alle Unterelemente löschen?")) {
		save_display(function(){
			new $ajax().ok(function(result) {
				location.href = "/backend/elementstree?json=0&id=<?= $this->get_value("id") ?>";
			}).del("/backend/elementstree/delete/" + id);
		});
	}
	return false;
}

function copy_subtree(id) {
	var newParent = parseInt($("#new_fk_id_parent_element_" + id).val());
	save_display(function(){
		new $ajax().ok(function(result) {
			result = JSON.parse(result);
			console.log(result);
			save_display(function(){ 
				location.href = "/backend/elementstree?json=0&id=<?= $this->get_value("id") ?>"; 
			});
		}).data("&id=" + id + "&fk_id_parent_element=" + newParent).post("/backend/elementstree/copysubtree/");
	});
	return false;
}

function getScrollXY() {
	var scrX = 0, scrY = 0;
 
	if( typeof( window.pageYOffset ) == 'number' ) {
		//Netscape compliant
		scrY = window.pageYOffset;
		scrX = window.pageXOffset;
	} else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
		//DOM compliant
		scrY = document.body.scrollTop;
		scrX = document.body.scrollLeft;
	} else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
		//IE6 standards compliant mode
		scrY = document.documentElement.scrollTop;
		scrX = document.documentElement.scrollLeft;
	}
	console.log("getScrollXY() : [ " + scrX + ", " + scrY +" ]");
	return [scrX, scrY];
}

function setScrollXY(scr) {
	scrX = scr[0];
	scrY = scr[1];
	console.log("setScrollXY(" + scrX + ", " + scrY +")");
	if (typeof( window.pageYOffset ) == 'number' ) {
		//Netscape compliant
		window.pageYOffset = scrX;
		window.pageXOffset = scrY;
	}
	if ((typeof(document.body) !== 'undefined') && ((typeof(document.body.scrollLeft) !== 'undefined') || (typeof(document.body.scrollTop) !== 'undefined'))) {
		//DOM compliant
		document.body.scrollTop = scrY;
		document.body.scrollLeft = scrX;
	}
	if (document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
		//IE6 standards compliant mode
		document.documentElement.scrollTop = scrY;
		document.documentElement.scrollLeft = scrX;
	}
	return [scrX, scrY];
}

function generate_seo_links() {
	new $ajax().ok(function(result) {
		result = JSON.parse(result);
		console.log(result);
		save_display(function(){ 
			location.href = "/backend/elementstree?json=0&id=<?= $this->get_value("id") ?>"; 
		});
	}).get("/backend/seolinks/generate/");
	return false;
}

function expand_all() {
	$(".subelem_display").each(function() {
		$(this).val(1);
		$('#subelems_' + parseInt($(this).attr("id"))).show(1000);
		$('#subelems_plh_' + parseInt($(this).attr("id"))).hide(1000);
		$('#subelems_btn_' + parseInt($(this).attr("id"))).show(1000);
	});
	save_display();
}

function collapse_all() {
	$(".subelem_display").each(function() {
		$(this).val(0);
		$('#subelems_' + parseInt($(this).attr("id"))).hide(1000);
		$('#subelems_plh_' + parseInt($(this).attr("id"))).show(1000);
		$('#subelems_btn_' + parseInt($(this).attr("id"))).hide(1000);
	});
	save_display();
}

restore_display();

</script>
