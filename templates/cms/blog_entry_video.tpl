<li>
	<h3><?= $this->data("title") ?></h3>
	<div class="clear"></div>
	<video style="width: 770px; height: 400px;" autoplay >
		<source src="<?= $this->data("src") ?>" type="video/ogg" />
	</video>
	<p>
		<?= $this->data("text") ?>
	</p>
</li>
