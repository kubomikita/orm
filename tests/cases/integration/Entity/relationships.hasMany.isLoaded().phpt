<?php

/**
 * @testCase
 */

namespace Nextras\Orm\Tests\Integrations;

use Mockery;
use Nextras\Orm\Tests\TestCase;
use Tester\Assert;


$dic = require_once __DIR__ . '/../../../bootstrap.php';


class RelationshipsHasManyIsLoadedTest extends TestCase
{

	public function testIsLoaded()
	{
		$author1 = $this->e('Nextras\Orm\Tests\Author');
		$this->e('Nextras\orm\Tests\Book', ['author' => $author1]);
		$author2 = $this->e('Nextras\Orm\Tests\Author');
		$this->e('Nextras\orm\Tests\Book', ['author' => $author2]);
		$this->orm->authors->persist($author1);
		$this->orm->authors->persist($author2);
		$this->orm->authors->flush();

		foreach ($this->orm->authors->findAll() as $author) {
			Assert::false($author->books->isLoaded());
		}

		foreach ($this->orm->authors->findAll() as $author) {
			foreach ($author->books as $book) {}
			Assert::true($author->books->isLoaded());
		}
	}

}


$test = new RelationshipsHasManyIsLoadedTest($dic);
$test->run();