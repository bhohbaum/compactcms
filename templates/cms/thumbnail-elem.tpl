<li class="span3">
	<div class="thumbnail thumbnail-1">
		<h3><?= $this->data("title") ?></h3>
		<a href="<?= $this->data("href") ?>">
			<img src="<?= $this->data("src") ?>" alt="">
		</a>
		<section>
			<strong><?= $this->data("subtitle") ?></strong>
			<p><?= $this->data("text") ?></p>
			<a href="<?= $this->data("href") ?>" class="btn btn-1"><?= $this->data("button") ?></a>
		</section>
	</div>
</li>