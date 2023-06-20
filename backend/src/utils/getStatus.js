export function generateResponse(myStatus, myObject, type) {
  if (myStatus === "SUCCESS")
    return {
      status: myStatus,
      message: `${myObject} was ${type} successfully.`,
    }
  return {
    status: myStatus,
    message: `Failed to ${type} ${myObject}.`,
  }
}
