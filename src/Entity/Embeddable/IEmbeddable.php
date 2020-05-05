<?php declare(strict_types = 1);

namespace Nextras\Orm\Entity\Embeddable;


use Nextras\Orm\Entity\IEntity;


interface IEmbeddable
{
	/**
	 * Returns true if property has a not null value.
	 */
	public function hasValue(string $name): bool;


	/**
	 * Returns value.
	 * @return mixed
	 */
	public function &getValue(string $name);


	/**
	 * Loads raw value from passed array.
	 * @internal
	 * @param array<string, mixed> $data
	 */
	public function setRawValue(array $data): void;


	/**
	 * Stores raw value and returns it as array.
	 * @internal
	 * @return array<string, mixed>
	 */
	public function getRawValue(): array;


	/**
	 * Attaches entity to embeddable object.
	 * This is called after injecting embeddable into property wrapper.
	 * @internal
	 */
	public function onAttach(IEntity $entity): void;
}
