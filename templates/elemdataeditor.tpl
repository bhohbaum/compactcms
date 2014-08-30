<?php if ($this->is_active("closeit")) { ?>
	<script type="text/javascript">
		window.close();
	</script>
<?php } ?>
<form method="post">
	<?php foreach ($this->get_value("edtypes") as $idx => $edtype)  { $edata = $this->get_value("edata"); $edata = $edata[$idx] ?>
		<label><?= $edtype["name"] ?></label>
		<textarea name="<?= $edtype["name"] ?>" rows="5" cols="80"><?= $edata["data"] ?></textarea>
		<br />
	<?php } ?>
	<input name="id" type="hidden" value="<?= $this->get_value("id") ?>" />
	<br /><br />
	<input type="submit" />
</form>
