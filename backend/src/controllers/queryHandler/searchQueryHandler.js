import prisma from "../../utils/prismaClient.js"

export async function searchItem(keyWord) {
  let result = await prisma.item.findMany({
    where: {
      item_name: {
        search: keyWord,
      },
    },
  })

  if (result.length > 0) {
    return result
  }
  if (result.length === 0) {
    result = await prisma.item.findMany({
      where: {
        description: {
          search: keyWord,
        },
      },
    })
  }

  if (result.length > 0) {
    return result
  }
  if (result.length === 0) {
    console.log("This keyword was not found anywhere!")
  }

  return result
}
