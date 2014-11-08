<?php if ($this->is_active("page")) { ?>
	<div style="background-color: #FEDDCC; position: fixed; margin-left: 50%; width: 50%">
		<button onclick="goto_elementstree()" style="margin: 20px">Elements Tree</button>
	</div>
	<div id="tpllist"></div>
	<div id="template"></div>
	<div id="datalist"></div>
	<script type="text/javascript">
		function load_tpllist() {
			new $ajax().ok(function(result) {
				result = JSON.parse(result);
				console.log(result);
				if (result) {
					$("#tpllist").html(result);
				}
			}).get("/backend/elementstree/viewstate");
		}

		function load_template() {

		}

		function load_tpldata() {

		}
	
		function goto_elementstree() {
			location.href = "/backend";
		}
	</script>
<?php } elseif ($this->is_active("tpllist")) { ?>

<?php } elseif ($this->is_active("datalist")) {?>

<?php } elseif ($this->is_active("template")) { ?><?= $this->get_value("template") ?><?php } ?>