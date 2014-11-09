<?php if ($this->is_active("page")) { ?>
	<div style="background-color: #FFFFEC">
		<div style="background-color: #FEDDCC; position: fixed; margin-left: 50%; width: 50%">
			<button onclick="goto_elementstree()" style="margin: 20px">Elements Tree</button>
			<button onclick="toggle_editing_pane()" style="margin: 20px">Toggle Template/Data</button>
		</div>
		<div id="tpllist" style="border-style: solid; border-color: black; border-width: 1px; width: 25%; height: 100%; overflow: scroll; float: left"></div>
		<div id="template">
			<div class="tplcontent_" style="height: 10%;">
				<div style="margin: 0px 10px 10px 26%;">Is Page: <input type="checkbox" /></div>
				<div style="margin: 0px 10px 10px 26%;">Descr.: <input type="text" /></div>
			</div>
			<div class="tplcontent">
				<textarea id="tplinput" class="tplcontent" wrap="off" style="width: 74%; height: 90%;"></textarea>
			</div>
			<div id="tpldata" style="border-style: solid; border-color: black; border-width: 1px; width: 74%; height: 90%; margin-left: 25%"></div>
		</div>
	</div>
	<script type="text/javascript">

		var editing_pane_content = "template";
		var selected_template = "";

		function toggle_editing_pane() {
			switch (editing_pane_content) {
			case "template":
				editing_pane_content = "data";
				load_tpldata();
				$(".tplcontent").hide(500);
				$("#tpldata").show(500);
				break;
			case "data":
				editing_pane_content = "template";
				load_template(selected_template);
				$(".tplcontent").show(500);
				$("#tpldata").hide(500);
				break;
			default:
				break;
			}
		}
		
		function load_tpllist() {
			new $ajax().ok(function(result) {
				console.log(result);
				if (result) {
					$("#tpllist").html(result);
				}
			}).get("/backend/templateeditor/tpllist");
		}

		function load_template(name) {
			selected_template = name;
			new $ajax().ok(function(result) {
				console.log(result);
				if (result) {
					$("#tplinput").val(result);
				}
			}).get("/backend/templateeditor/template/" + name);
		}

		function load_tpldata(name) {
			new $ajax().ok(function(result) {
				console.log(result);
				if (result) {
					$("#tpldata").html(result);
				}
			}).get("/backend/templateeditor/tpldata/" + name);
		}
	
		function goto_elementstree() {
			location.href = "/backend";
		}

		$( "button" ).click(function(event) {
			event.preventDefault();
		});

		$("#tpldata").hide(500);
		load_tpllist();
		
	</script>
<?php } elseif ($this->is_active("tpllist")) { ?>
	<?php foreach ($this->get_value("elemtypes") as $elemtype) { ?>
		<div style="border-style: solid; border-color: black; border-width: 1px; cursor: pointer;" onclick="load_template('<?= $elemtype->template ?>'); load_tpldata('<?= $elemtype->template ?>');">
			<p>
			<button onclick="delete_template(<?= $elemtype->id_element_types ?>)">X</button>
			<?= $elemtype->template ?>
			</p>
		</div>
	<?php } ?>
<?php } elseif ($this->is_active("tpldata")) {?>

<?php } elseif ($this->is_active("template")) { ?><?= $this->get_value("template") ?><?php } ?>