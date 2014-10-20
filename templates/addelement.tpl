<div style="background-color: #FFFFEC">
	<?php if ($this->is_active("closeit")) { ?>
		<script type="text/javascript">
			window.close();
		</script>
	<?php } ?>
	<form method="post">
		<label>Description</label>
		<br />
		<textarea name="description" rows="5" cols="80"></textarea>
		<br />
		<label>Element type:</label>
		<br />
		<select name="fk_id_element_types" size="1">
			<?php foreach ($this->get_value("etypes") as $key => $val) { ?>
				<option value="<?= $val["id_element_types"] ?>">
					<?= $val["is_page"] ? "Page: " : "Elem: " ?> <?= $val["description"] ?>
				</option>
			<?php } ?>
		</select>
		<br />
		<label>Ordinal:</label>
		<br />
		<input name="ordinal" type="text" value="" />
		<br />
		<label>Position:</label>
		<br />
		<input name="position" type="text" value="" />
		<br />
		<input name="fk_id_parent_element" type="hidden" value="<?= $this->get_value("id") ?>" />
		<br /><br />
		<input type="submit" />
	</form>
</div>