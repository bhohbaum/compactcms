<?php if ($this->is_active("page")) { ?>
	<div style="background-color: #FFFFEC">
		<div style="background-color: #FEDDCC; position: fixed; margin-left: 50%; width: 50%">
			<button onclick="goto_elementstree()" style="margin: 20px">Elements Tree</button>
			<button onclick="toggle_editing_pane(); return false;" style="margin: 20px">Toggle Template/Data</button>
		</div>
		<div id="tpllist" style="border-style: solid; border-color: black; border-width: 1px; width: 25%; height: 100%; overflow: scroll; float: left"></div>
		<div id="template">
			<div class="tplcontent_" style="height: 10%;">
				<div style="width: 50%; height: 8px;">&nbsp;</div>
				<div style="margin: 0px 10px 10px 26%;">Is Page: <input type="checkbox" id="is_page" onchange="update_elemtype(selected_template)" /></div>
				<div style="margin: 0px 10px 10px 26%;">Descr.: <input type="text" id="description" onchange="update_elemtype(selected_template)" /></div>
			</div>
			<div class="tplcontent">
				<textarea id="tplinput" class="tplcontent" wrap="off" onchange="save_template(selected_template)" style="width: 74%; height: 90%;" /></textarea>
			</div>
			<div id="tpldata" style="border-style: solid; border-color: black; border-width: 1px; width: 74%; height: 90%; margin-left: 25%"></div>
		</div>
	</div>
	<script type="text/javascript">

		var editing_pane_content = "template";
		var selected_template = "";
		var last_del_id = null;

		function get_selected_template() {
			var found = false;
			var found_id = "";
			var tmp = null;
			$(".tplbtn").each(function() {
				found_id = $(this).attr("id");
				tmp = found_id.split("_");
				tmp = tmp[1];
				if (tmp == selected_template) {
					found = true;
				}
			});
			if (!found) {
				selected_template = tmp;
			}
			return selected_template;
		}
		
		function toggle_editing_pane() {
			switch (editing_pane_content) {
			case "template":
				editing_pane_content = "data";
				load_tpldata(get_selected_template());
				$(".tplcontent").hide(500);
				$("#tpldata").show(500);
				break;
			case "data":
				editing_pane_content = "template";
				load_template(get_selected_template());
				$(".tplcontent").show(500);
				$("#tpldata").hide(500);
				break;
			default:
				break;
			}
		}
		
		function load_tpllist(cb) {
			new $ajax().ok(function(result) {
				console.log(result);
				if (result) {
					$("#tpllist").html(result);
					if (cb) {
						cb();
					}
				}
			}).get("/backend/templateeditor/tpllist");
		}

		function load_template(id) {
			selected_template = id;
			$("#tplinput").attr("data-path", "/backend/templateeditor/template/" + id);
			new $ajax().ok(function(result) {
				console.log(result);
				if (result != null) {
					$("#tplinput").val(result);
				}
			}).get("/backend/templateeditor/template/" + id);
		}

		function load_tpldata(id) {
			new $ajax().ok(function(result) {
				console.log(result);
				if (result) {
					$("#tpldata").html(result);
					$("button").click(function(event) {
						event.preventDefault();
					});
				}
			}).get("/backend/templateeditor/tpldata/" + id);
			new $ajax().ok(function(result) {
				console.log(result);
				result = JSON.parse(result);
				if (result != null) {
					$("#description").val(result["description"]);
					$("#is_page").prop("checked", (result["is_page"] == "1") ? true : false);
				}
			}).get("/backend/templateeditor/elemtype/" + id);
		}

		function update_elemtype(id) {
			var is_page = $("#is_page").is(':checked') ? "1" : "0";
			var desc = $("#description").val();
			var etype = '{ "is_page": "' + is_page + '", "description": "' + desc + '" }';
			new $ajax().ok(function(result) {
				console.log(result);
				load_tpllist(function() {
					load_all_tpl_data(get_selected_template());
				});
			}).data("&data=" + escape(etype)).post("/backend/templateeditor/elemtype/" + id);
		}

		function load_all_tpl_data(id) {
			if (id == last_del_id) return;
			$(".tplbtn").each(function() {
				$(this).css("background-color", "#FFFFEC");
			});
			$("#tplbtn_" + id).css("background-color", "#FFEFDC");
			load_template(id);
			load_tpldata(id);
		}
	
		function goto_elementstree() {
			location.href = "/backend";
		}

		function save_template(id) {
			new $ajax().ok(function(result) {
				console.log(result);
			}).data("&data=" + escape($("#tplinput").val())).post("/backend/templateeditor/template/" + id);
		}

		function add_template_s1() {
			$("#newtplbtn").hide();
			$("#newtplinput").show();
			$("#tplnameinput").focus();
		}

		function add_template_s2() {
			add_template_s3();
			if ($("#tplnameinput").val() != "") {
				new $ajax().ok(function(result) {
					console.log(result);
					load_tpllist(function() {
// 						load_all_tpl_data(get_selected_template());
					});
				}).err(function(result) {
					console.log(result);
					load_tpllist(function() {
// 						load_all_tpl_data(get_selected_template());
					});
				}).put("/backend/templateeditor/template/" + $("#tplnameinput").val());
			}
		}

		function add_template_s3() {
			$("#newtplbtn").show();
			$("#newtplinput").hide();
		}
		
		function add_template_data_s1() {
			$("#newtpldatabtn").hide();
			$("#newtpldatainput").show();
			$("#tpldatanameinput").focus();
		}

		function add_template_data_s2() {
			add_template_data_s3();
			if ($("#tpldatanameinput").val() != "") {
				new $ajax().ok(function(result) {
					console.log(result);
					load_tpldata(get_selected_template());
				}).err(function(result) {
					console.log(result);
					load_tpldata(get_selected_template());
				}).put("/backend/templateeditor/templatedata/" + $("#tpldatanameinput").val());
			}
		}
		
		function add_template_data_s3() {
			$("#newtpldatabtn").show();
			$("#newtpldatainput").hide();
		}
		
		function delete_template(id) {
			var msg = "Do you really want to delete the template?";
			if (confirm(msg)) {
				last_del_id = id;
				new $ajax().ok(function(result) {
					console.log(result);
					load_tpllist(function() {
						load_all_tpl_data(get_selected_template());
					});
				}).err(function(result) {
					console.log(result);
					load_tpllist(function() {
// 						load_all_tpl_data(get_selected_template());
					});
				}).del("/backend/templateeditor/template/" + id);
			}
		}

		function delete_template_data(id) {
			var msg = "Do you really want to delete the template data field?";
			if (confirm(msg)) {
// 				last_del_id = id;
				new $ajax().ok(function(result) {
					console.log(result);
					load_tpllist(function() {
						load_all_tpl_data(get_selected_template());
					});
				}).err(function(result) {
					console.log(result);
					load_tpllist(function() {
						load_all_tpl_data(get_selected_template());
					});
				}).del("/backend/templateeditor/templatedata/" + id);
			}
		}

		function add_data_elem(id) {
			new $ajax().ok(function(result) {
				load_tpldata(get_selected_template());
			}).data("&fieldid=" + id + "&tplid=" + get_selected_template()).post("/backend/templateeditor/usedata");
		}

		function remove_data_elem(id) {
			new $ajax().ok(function(result) {
				load_tpldata(get_selected_template());
			}).data("&fieldid=" + id + "&tplid=" + get_selected_template()).post("/backend/templateeditor/unusedata");
		}

		$("button").click(function(event) {
			event.preventDefault();
		});

		$("#tpldata").hide(500);
		load_tpllist();
		
	</script>
<?php } elseif ($this->is_active("tpllist")) { ?>
	<?php foreach ($this->get_value("elemtypes") as $elemtype) { ?>
		<div id="tplbtn_<?= $elemtype->id_element_types ?>" class="tplbtn" 
				style="background-color: #FFFFEC; border-style: solid; border-color: black; border-width: 1px; cursor: pointer; height: 50px" 
				onclick="load_all_tpl_data(<?= $elemtype->id_element_types ?>);">
			<p>
				<button onclick="delete_template(<?= $elemtype->id_element_types ?>); return false;">X</button>
				<?= $elemtype->template ?>
			</p>
		</div>
	<?php } ?>
	<div id="tplbtn_new" class="tplbtn" style="background-color: #FFFFEC; border-style: solid; border-color: black; border-width: 1px; cursor: pointer; height: 50px" onmouseover="add_template_s1();" onmouseout="add_template_s2()">
		<p id="newtplbtn" onclick="add_template_s1();">
			New...
		</p>
		<div id="newtplinput" style="display: none; padding: 13px;">
			<input type="text" id="tplnameinput" style="width: 100%;" />
		</div>
	</div>
<?php } elseif ($this->is_active("tpldata")) { ?>
	<div style="width: 700px; float: left; height: 100%; border-style: solid; border-color: black; border-width: 1px">
		<div style="float: none; overflow: scroll;">
			<div id="notusedtpldata" style="float: left; border-style: solid; border-color: black; border-width: 1px; width: 40%; height: 70%; overflow: scroll;">
				<?php foreach ($this->get_value("unused") as $nu) { ?>
					<div onclick="add_data_elem(<?= $nu->id_element_data_types ?>)" style="padding-left: 13px; padding-right: 13px; height: 50px; border-style: solid; border-color: black; border-width: 1px;">
						<p>
							<button onclick="delete_template_data(<?= $nu->id_element_data_types ?>); return false;">X</button>
							<?= $nu->name ?>
						</p>
					</div>
				<?php } ?>
				<div style="width: 100%; background-color: #FFFFEC; border-style: solid; border-color: black; border-width: 1px; cursor: pointer; height: 50px" onmouseover="add_template_data_s1();" onmouseout="add_template_data_s2()">
					<p id="newtpldatabtn">
						New...
					</p>
					<div id="newtpldatainput" style="display: none; padding: 13px;">
						<input type="text" id="tpldatanameinput" style="width: 100%;" />
					</div>
				</div>
			</div>
			<div id="usedtpldata" style="float: right; border-style: solid; border-color: black; border-width: 1px; width: 40%; height: 70%; overflow: scroll;">
				<?php foreach ($this->get_value("used") as $u) { ?>
					<div onclick="remove_data_elem(<?= $u->id_element_data_types ?>)" style="padding-left: 13px; padding-right: 13px; height: 50px; border-style: solid; border-color: black; border-width: 1px;">
						<p>
							<?= $u->name ?>
						</p>
					</div>
				<?php } ?>
			</div>
		</div>
		<div id="tpldatastatus">
		</div>
	</div>
<?php } elseif ($this->is_active("template")) { ?><?= UTF8::encode($this->get_value("template")) ?><?php } ?>