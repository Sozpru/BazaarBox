import prisma from "../utils/prismaClient.js"
import { generateResponse } from "../utils/getStatus.js"

export async function getItems(req, res) {
  const result = await prisma.item.findMany({})

  res.status(200).send(result)
}

export async function getItem(req, res) {
  try {
    // Get the item ID from the URL params
    const id = parseInt(req.params.id, 10)

    // Find the item in the database
    const item = await prisma.item.findUnique({ where: { id } })

    // If the item does not exist, return an error response
    if (!item) {
      return res.status(404).send("Item not found")
    }

    // Return a response with the item
    res.json(item)
  } catch (error) {
    console.error(error)
    res.status(500).send("An error occurred while getting the item")
  }
}

export async function addItem(req, res) {
  if (!req.body) {
    res
      .status(200)
      .json(
        generateResponse("FAIL", null, "add item, request body is missing!")
      )
  } else {
    try {
      // Get the item input from the request body
      var { item_name, description, category, price, image_url } = req.body
console.log(req.body)

price = parseFloat(price)
      // Create a new item record in the database
      const item = await prisma.item.create({
        data: {
          item_name,
          description,
          category,
          price, 
          image_url,
        },
      })

      // Return a response with the newly created item
      res.status(201).json(item)
    } catch (error) {
      console.error(error)
      res.status(500).send("An error occurred while adding the item")
    }
  }
}

export async function updateItem(req, res) {
  try {
    // Get the item ID from the URL params
    const id = parseInt(req.params.id, 10)

    // Get the updated item data from the request body
    var { item_name, description, category, price, image_url } = req.body

    // Find the item in the database
    const item = await prisma.item.findUnique({ where: { id } })
    price = parseFloat(price)
    // If the item does not exist, return an error response
    if (!item) {
      return res.status(404).send("Item not found")
    }

    // Update the item record in the database
    const updatedItem = await prisma.item.update({
      where: { id },
      data: {
        item_name,
        description,
        category,
        price, 
        image_url,
      },
    })

    // Return a response with the updated item
    res.json(updatedItem)
  } catch (error) {
    console.error(error)
    res.status(500).send("An error occurred while updating the item")
  }
}

// eslint-disable-next-line consistent-return
export async function deleteItem(req, res) {
  try {
    // Get the item ID from the URL params
    const id = parseInt(req.params.id, 10)

    // Find the item in the database
    const item = await prisma.item.findUnique({ where: { id } })

    // If the item does not exist, return an error response
    if (!item) {
      return res.status(404).send("Item not found")
    }

    // Delete the item record from the database
    await prisma.item.delete({ where: { id } })

    // Return a response indicating success
    res.status(204).send("item delted successfully")
  } catch (error) {
    console.error(error)
    res.status(500).send("An error occurred while deleting the item")
  }
}
